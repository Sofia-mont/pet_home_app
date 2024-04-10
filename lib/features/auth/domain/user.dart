library core;

import 'package:freezed_annotation/freezed_annotation.dart';

part 'user.freezed.dart';
part 'user.g.dart';

@freezed
abstract class User with _$User {
  factory User(
    @JsonKey(name: 'name') String? name,
    @JsonKey(name: 'email') String? email,
    @JsonKey(name: 'password') String? password,
    @JsonKey(name: 'userType') String? userType,
    @JsonKey(name: 'department') String? department,
    @JsonKey(name: 'city') String? city,
  ) = _User;

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);
}
