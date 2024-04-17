library core;

import 'package:freezed_annotation/freezed_annotation.dart';

part 'register_user.freezed.dart';
part 'register_user.g.dart';

@freezed
abstract class RegisterUser with _$RegisterUser {
  factory RegisterUser(
    @JsonKey(name: 'name') String? name,
    @JsonKey(name: 'email') String? email,
    @JsonKey(name: 'password') String? password,
    @JsonKey(name: 'userType') String? userType,
    @JsonKey(name: 'department') String? department,
    @JsonKey(name: 'city') String? city,
  ) = _RegisterUser;

  factory RegisterUser.fromJson(Map<String, dynamic> json) =>
      _$RegisterUserFromJson(json);
}
