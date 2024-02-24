import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pet_home/core/router/router.dart';
import 'package:pet_home/features/auth/model/user.dart';
import 'package:pet_home/features/auth/provider/auth_state.dart';
import 'package:pet_home/features/auth/service/auth_service.dart';

final authProvider = StateNotifierProvider<AuthStateNotifier, AuthState>(
  AuthStateNotifier.fromRef,
);

class AuthStateNotifier extends StateNotifier<AuthState> {
  AuthStateNotifier({required this.ref, required this.authService})
      : super(const AuthState.initial());

  factory AuthStateNotifier.fromRef(Ref ref) {
    return AuthStateNotifier(
      ref: ref,
      authService: ref.read(authServiceProvider),
    );
  }

  final AuthService authService;
  final Ref ref;
  register({
    required User user,
  }) async {
    try {
      state = const AuthState.loading();
      final response = await authService.register(user);
      if (response.hasError) {
        return state = AuthState.error(response.asError!.error);
      }
      if (response.value!) {
        ref.read(appRouterProvider).pushNamed('/login');
        return;
      }
    } catch (e) {
      return state = AuthState.error(e);
    }
  }
}
