import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pet_home/features/auth/provider/auth_state.dart';
import 'package:pet_home/features/auth/service/auth_service.dart';

final authStateNotifier =
    StateNotifierProvider<AuthStateNotifier, AuthState>((ref) {
  AuthService service = ref.read(authServiceProvider);
  return AuthStateNotifier(service);
});

class AuthStateNotifier extends StateNotifier<AuthState> {
  AuthStateNotifier(this.authService) : super(const AuthState.initial());

  final AuthService authService;
  register() async {
    try {
      state = const AuthState.loading();
      final response = await authService.register();
      if (response.hasError) {
        return state = AuthState.error(response.asError!.error);
      } else {
        return state = AuthState.successRegister(response.value!);
      }
    } catch (e) {
      return state = AuthState.error(e);
    }
  }
}
