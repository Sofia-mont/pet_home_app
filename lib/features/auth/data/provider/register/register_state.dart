import 'package:equatable/equatable.dart';
import 'package:pet_home/core/sealed/custom_async_value.dart';
import 'package:pet_home/features/auth/domain/register_user/register_user.dart';

class LoginState extends Equatable {
  const LoginState({required this.registerUser});

  factory LoginState.initial() =>
      const LoginState(registerUser: AppAsync.loading());

  final AppAsync<RegisterUser> registerUser;

  @override
  List<Object?> get props => [registerUser];

  LoginState copyWith({AppAsync<RegisterUser>? registerUser}) =>
      LoginState(registerUser: registerUser ?? this.registerUser);
}
