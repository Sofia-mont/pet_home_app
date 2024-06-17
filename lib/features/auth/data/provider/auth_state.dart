import 'package:equatable/equatable.dart';
import 'package:pet_home/core/sealed/custom_async_value.dart';
import 'package:pet_home/features/auth/domain/register_request.dart';
import 'package:pet_home/features/auth/domain/token.dart';

class AuthState extends Equatable {
  const AuthState({required this.userToken, required this.registerUser});

  factory AuthState.initial() => const AuthState(
        userToken: AppAsync.loading(),
        registerUser: AppAsync.loading(),
      );

  final AppAsync<Token> userToken;
  final AppAsync<RegisterRequest> registerUser;

  @override
  List<Object?> get props => [userToken, registerUser];

  AuthState copyWith({
    AppAsync<Token>? userToken,
    AppAsync<RegisterRequest>? registerUser,
  }) =>
      AuthState(
        userToken: userToken ?? this.userToken,
        registerUser: registerUser ?? this.registerUser,
      );
}
