import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pet_home/core/extension_methods/future_extension.dart';
import 'package:pet_home/core/router/router.dart';
import 'package:pet_home/core/sealed/either.dart';
import 'package:pet_home/features/auth/data/provider/register/register_state.dart';
import 'package:pet_home/features/auth/data/repository/auth_repository.dart';
import 'package:pet_home/features/auth/domain/register_user/register_user.dart';
import 'package:pet_home/features/auth/presentation/login/login_user_screen.dart';
import 'package:pet_home/ui/widgets/modals/custom_modals.dart';

final registerProvider = StateNotifierProvider<RegisterNotifier, LoginState>(
  RegisterNotifier.fromRef,
);

class RegisterNotifier extends StateNotifier<LoginState> {
  RegisterNotifier({
    required this.ref,
    required this.authRepository,
  }) : super(LoginState.initial());

  factory RegisterNotifier.fromRef(Ref ref) {
    return RegisterNotifier(
      ref: ref,
      authRepository: ref.read(authRepositoryProvider),
    );
  }

  final AuthRepository authRepository;
  final Ref ref;

  void resetState() => state = LoginState.initial();

  Future<void> register({
    required RegisterUser user,
    required BuildContext context,
  }) async {
    final res = await authRepository.register(user: user).toEither();
    res.fold(
      (left) => ref
          .read(customModalsProvider)
          .showAlertDialog(context: context, message: left.message),
      (right) => ref.read(customModalsProvider).showAlertDialog(
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
}
