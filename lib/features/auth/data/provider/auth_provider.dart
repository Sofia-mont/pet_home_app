// ignore_for_file: avoid_manual_providers_as_generated_provider_dependency
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
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'auth_provider.g.dart';

@riverpod
class AuthNotifier extends _$AuthNotifier {
  @override
  AuthState build() => AuthState.initial();

  void resetState() => state = AuthState.initial();

  Future<void> register({required RegisterUser user}) async {
    ref.read(customModalsProvider).showLoadingDialog();
    final res =
        await ref.read(authRepositoryProvider).register(user: user).toEither();
    ref.read(customModalsProvider).pop();
    res.fold(
      (left) => ref
          .read(customModalsProvider)
          .showInformativeScreen(message: left.message),
      (right) => ref.read(customModalsProvider).showInformativeScreen(
            isError: false,
            message: 'Ahora puedes iniciar sesión.',
            title: '¡Registro exitoso!',
            buttonMsg: 'Iniciar sesión',
            onPressed: () =>
                ref.read(appRouterProvider).goNamed(LoginUserScreen.path),
          ),
    );
  }

  Future<void> login({required User user}) async {
    ref.read(customModalsProvider).showLoadingDialog();
    final res =
        await ref.read(authRepositoryProvider).login(user: user).toEither();
    ref.read(customModalsProvider).pop();
    res.fold(
      (left) => ref.read(customModalsProvider).showInfoDialog(
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
    final res = await ref
        .read(authRepositoryProvider)
        .refreshToken(refreshToken: token)
        .toEither();
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
