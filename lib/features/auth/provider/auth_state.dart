import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:pet_home/features/auth/model/user.dart';

part 'auth_state.freezed.dart';

@freezed
abstract class AuthState with _$AuthState {
  const factory AuthState.initial() = _AuthInitial;
  const factory AuthState.loading() = _AuthLoading;
  const factory AuthState.successRegister(User user) = _AuthSuccessRegister;
  const factory AuthState.successLogin() = _AuthSuccessLogin;
  const factory AuthState.error([@Default('') message]) = _AuthError;
}
