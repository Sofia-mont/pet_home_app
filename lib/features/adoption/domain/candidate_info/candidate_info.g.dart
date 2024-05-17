// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'candidate_info.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$CandidateInfoImpl _$$CandidateInfoImplFromJson(Map<String, dynamic> json) =>
    _$CandidateInfoImpl(
      fullname: json['fullname'] as String,
      age: json['age'] as String,
      department: json['department'] as String,
      city: json['city'] as String,
      neighborhood: json['neighborhood'] as String,
      address: json['address'] as String,
      phoneNumber: json['phoneNumber'] as String,
      email: json['email'] as String,
      occupation: json['occupation'] as String,
    );

Map<String, dynamic> _$$CandidateInfoImplToJson(_$CandidateInfoImpl instance) =>
    <String, dynamic>{
      'fullname': instance.fullname,
      'age': instance.age,
      'department': instance.department,
      'city': instance.city,
      'neighborhood': instance.neighborhood,
      'address': instance.address,
      'phoneNumber': instance.phoneNumber,
      'email': instance.email,
      'occupation': instance.occupation,
    };
