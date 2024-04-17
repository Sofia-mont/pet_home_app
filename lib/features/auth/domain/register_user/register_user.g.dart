// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'register_user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$RegisterUserImpl _$$RegisterUserImplFromJson(Map<String, dynamic> json) =>
    _$RegisterUserImpl(
      json['name'] as String?,
      json['email'] as String?,
      json['password'] as String?,
      json['userType'] as String?,
      json['department'] as String?,
      json['city'] as String?,
    );

Map<String, dynamic> _$$RegisterUserImplToJson(_$RegisterUserImpl instance) =>
    <String, dynamic>{
      'name': instance.name,
      'email': instance.email,
      'password': instance.password,
      'userType': instance.userType,
      'department': instance.department,
      'city': instance.city,
    };
