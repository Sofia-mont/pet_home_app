// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'form_adoption_projection.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$FormAdoptionProjectionImpl _$$FormAdoptionProjectionImplFromJson(
        Map<String, dynamic> json) =>
    _$FormAdoptionProjectionImpl(
      getId: json['getId'] as int,
      getSentAt: DateTime.parse(json['getSentAt'] as String),
      getCandidateFullName: json['getCandidateFullName'] as String,
      getPostPetName: json['getPostPetName'] as String,
    );

Map<String, dynamic> _$$FormAdoptionProjectionImplToJson(
        _$FormAdoptionProjectionImpl instance) =>
    <String, dynamic>{
      'getId': instance.getId,
      'getSentAt': instance.getSentAt.toIso8601String(),
      'getCandidateFullName': instance.getCandidateFullName,
      'getPostPetName': instance.getPostPetName,
    };
