// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'form_adoption_projection.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$FormAdoptionProjectionImpl _$$FormAdoptionProjectionImplFromJson(
        Map<String, dynamic> json) =>
    _$FormAdoptionProjectionImpl(
      id: json['id'] as int,
      sentAt: DateTime.parse(json['sentAt'] as String),
      candidateFullName: json['candidateFullName'] as String,
      postPetName: json['postPetName'] as String,
    );

Map<String, dynamic> _$$FormAdoptionProjectionImplToJson(
        _$FormAdoptionProjectionImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'sentAt': instance.sentAt.toIso8601String(),
      'candidateFullName': instance.candidateFullName,
      'postPetName': instance.postPetName,
    };
