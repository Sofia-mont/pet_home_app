// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$UserImpl _$$UserImplFromJson(Map<String, dynamic> json) => _$UserImpl(
      json['name'] as String?,
      json['email'] as String?,
      json['password'] as String?,
      json['userType'] as String?,
      json['department'] as String?,
      json['city'] as String?,
    );

Map<String, dynamic> _$$UserImplToJson(_$UserImpl instance) =>
    <String, dynamic>{
      'name': instance.name,
      'email': instance.email,
      'password': instance.password,
      'userType': instance.userType,
      'department': instance.department,
      'city': instance.city,
    };
