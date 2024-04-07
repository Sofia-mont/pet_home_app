import 'package:equatable/equatable.dart';
import 'package:pet_home/core/sealed/custom_async_value.dart';
import 'package:pet_home/features/auth/domain/user.dart';

class RegisterState extends Equatable {
  const RegisterState({required this.registerUser});

  factory RegisterState.initial() =>
      const RegisterState(registerUser: AppAsync.loading());

  final AppAsync<User> registerUser;

  @override
  List<Object?> get props => [registerUser];

  RegisterState copyWith({AppAsync<User>? registerUser}) =>
      RegisterState(registerUser: registerUser ?? this.registerUser);
}
