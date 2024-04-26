import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pet_home/core/app/app_service.dart';
import 'package:pet_home/core/app/domain/user_data.dart';
import 'package:pet_home/core/extension_methods/future_extension.dart';
import 'package:pet_home/core/router/router.dart';
import 'package:pet_home/core/sealed/either.dart';
import 'package:pet_home/features/auth/data/provider/auth_state.dart';
import 'package:pet_home/features/auth/data/repository/auth_repository.dart';
import 'package:pet_home/features/auth/domain/register_user/register_user.dart';
import 'package:pet_home/features/auth/domain/user/user.dart';
import 'package:pet_home/features/auth/presentation/login/login_user_screen.dart';
import 'package:pet_home/features/home/presentation/home_screen.dart';
import 'package:pet_home/ui/widgets/modals/custom_modals.dart';

final authProvider = StateNotifierProvider<AuthNotifier, AuthState>(
  AuthNotifier.fromRef,
);

class AuthNotifier extends StateNotifier<AuthState> {
  AuthNotifier({
    required this.ref,
    required this.authRepository,
  }) : super(AuthState.initial());

  factory AuthNotifier.fromRef(Ref ref) {
    return AuthNotifier(
      ref: ref,
      authRepository: ref.read(authRepositoryProvider),
    );
  }

  final AuthRepository authRepository;
  final Ref ref;

  void resetState() => state = AuthState.initial();

  Future<void> register({
    required RegisterUser user,
    required BuildContext context,
  }) async {
    final res = await authRepository.register(user: user).toEither();
    res.fold(
      (left) => ref
          .read(customModalsProvider)
          .showInformativeScreen(context: context, message: left.message),
      (right) => ref.read(customModalsProvider).showInformativeScreen(
            context: context,
            isError: false,
            message: 'Ahora puedes iniciar sesión.',
            title: '¡Registro exitoso!',
            buttonMsg: 'Iniciar sesión',
            onPressed: () =>
                ref.read(appRouterProvider).goNamed(LoginUserScreen.path),
          ),
    );
  }

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
            user: user.email,
            pass: user.password,
          ),
        );
        ref.read(appRouterProvider).goNamed(HomeScreen.path);
      },
    );
  }

  Future<void> refreshToken({required String token}) async {
    final res =
        await authRepository.refreshToken(refreshToken: token).toEither();
    res.fold(
      (left) => AppService.instance.manageAutoLogout(),
      (right) => AppService.instance.setUserData(
        UserData(
          id: DateTime.now().millisecondsSinceEpoch.toString(),
          refreshToken: right.refreshToken,
          token: right.token,
        ),
      ),
    );
  }
}
