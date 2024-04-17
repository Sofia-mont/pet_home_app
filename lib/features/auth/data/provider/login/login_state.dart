import 'package:equatable/equatable.dart';
import 'package:pet_home/core/sealed/custom_async_value.dart';
import 'package:pet_home/features/auth/domain/token/token.dart';

class LoginState extends Equatable {
  const LoginState({required this.userToken});

  factory LoginState.initial() =>
      const LoginState(userToken: AppAsync.loading());

  final AppAsync<Token> userToken;

  @override
  List<Object?> get props => [userToken];

  LoginState copyWith({AppAsync<Token>? userToken}) =>
      LoginState(userToken: userToken ?? this.userToken);
}
