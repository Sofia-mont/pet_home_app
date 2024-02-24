import 'package:freezed_annotation/freezed_annotation.dart';

part 'user.freezed.dart';
part 'user.g.dart';

@freezed
abstract class User with _$User {
  const factory User(
    String? name,
    String? email,
    String? password,
    String? userType,
    String? deparment,
    String? city,
  ) = _User;

  factory User.fromJson(Map<String, Object?> json) => _$UserFromJson(json);
}