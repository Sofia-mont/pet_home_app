// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'publication.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$PublicationImpl _$$PublicationImplFromJson(Map<String, dynamic> json) =>
    _$PublicationImpl(
      id: json['id'] as int,
      department: json['department'] as String,
      city: json['city'] as String,
      petName: json['petName'] as String,
      petHistory: json['petHistory'] as String,
      petPersonality: json['petPersonality'] as String,
      petType: json['petType'] as String,
      petSex: json['petSex'] as String,
      petAge: json['petAge'] as String,
      petSize: json['petSize'] as String,
      postState: json['postState'] as String,
      vaccinated: json['vaccinated'] as bool,
      dewormed: json['dewormed'] as bool,
      neutered: json['neutered'] as bool,
      createdAt: json['created_at'] == null
          ? null
          : DateTime.parse(json['created_at'] as String),
      user: json['user'] == null
          ? null
          : PostOwner.fromJson(json['user'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$PublicationImplToJson(_$PublicationImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'department': instance.department,
      'city': instance.city,
      'petName': instance.petName,
      'petHistory': instance.petHistory,
      'petPersonality': instance.petPersonality,
      'petType': instance.petType,
      'petSex': instance.petSex,
      'petAge': instance.petAge,
      'petSize': instance.petSize,
      'postState': instance.postState,
      'vaccinated': instance.vaccinated,
      'dewormed': instance.dewormed,
      'neutered': instance.neutered,
      'created_at': instance.createdAt?.toIso8601String(),
      'user': instance.user,
    };
