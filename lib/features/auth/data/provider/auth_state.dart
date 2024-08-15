import 'package:equatable/equatable.dart';
import 'package:pet_home/core/sealed/custom_async_value.dart';
import 'package:pet_home/features/auth/domain/register_request.dart';
import 'package:pet_home/features/auth/domain/token.dart';
import 'package:pet_home/features/posts/domain/post_owner.dart';

class AuthState extends Equatable {
  const AuthState({
    required this.userToken,
    required this.registerUser,
    required this.user,
  });

  factory AuthState.initial() => const AuthState(
        userToken: AppAsync.loading(),
        registerUser: AppAsync.loading(),
        user: AppAsync.loading(),
      );

  final AppAsync<Token> userToken;
  final AppAsync<RegisterRequest> registerUser;
  final AppAsync<PostOwner> user;

  @override
  List<Object?> get props => [userToken, registerUser, user];

  AuthState copyWith({
    AppAsync<Token>? userToken,
    AppAsync<RegisterRequest>? registerUser,
    AppAsync<PostOwner>? user,
  }) =>
      AuthState(
        userToken: userToken ?? this.userToken,
        registerUser: registerUser ?? this.registerUser,
        user: user ?? this.user,
      );
}
