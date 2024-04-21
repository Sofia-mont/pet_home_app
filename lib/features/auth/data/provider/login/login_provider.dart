import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pet_home/core/app/app_service.dart';
import 'package:pet_home/core/app/domain/user_data.dart';
import 'package:pet_home/core/extension_methods/future_extension.dart';
import 'package:pet_home/core/router/router.dart';
import 'package:pet_home/core/sealed/either.dart';
import 'package:pet_home/features/auth/data/provider/register/register_state.dart';
import 'package:pet_home/features/auth/data/repository/auth_repository.dart';
import 'package:pet_home/features/auth/domain/user/user.dart';
import 'package:pet_home/features/home/presentation/home_screen.dart';
import 'package:pet_home/ui/widgets/modals/custom_modals.dart';

final loginProvider = StateNotifierProvider<LoginNotifier, LoginState>(
  LoginNotifier.fromRef,
);

class LoginNotifier extends StateNotifier<LoginState> {
  LoginNotifier({
    required this.ref,
    required this.authRepository,
  }) : super(LoginState.initial());

  factory LoginNotifier.fromRef(Ref ref) {
    return LoginNotifier(
      ref: ref,
      authRepository: ref.read(authRepositoryProvider),
    );
  }

  final AuthRepository authRepository;
  final Ref ref;

  void resetState() => state = LoginState.initial();

  Future<void> login({
    required User user,
    required BuildContext context,
  }) async {
    final res = await authRepository.login(user: user).toEither();
    res.fold(
      (left) => ref.read(customModalsProvider).showInfoDialog(
            buildContext: context,
            title: 'Error al iniciar sesión',
            content: left.message,
            buttonText: 'Reintentar',
            buttonAction: () => ref.read(appRouterProvider).pop(),
          ),
      (right) {
        AppService.instance.setUserData(
          UserData(
            id: DateTime.now().millisecondsSinceEpoch.toString(),
            refreshToken: right.refreshToken,
            token: right.token,
          ),
        );
        ref.read(appRouterProvider).goNamed(HomeScreen.path);
      },
    );
  }
}
