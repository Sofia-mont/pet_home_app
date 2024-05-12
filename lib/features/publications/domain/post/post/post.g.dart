// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'post.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$PostImpl _$$PostImplFromJson(Map<String, dynamic> json) => _$PostImpl(
      id: json['id'] as int,
      department: json['department'] as String,
      city: json['city'] as String,
      petName: json['petName'] as String,
      petHistory: json['petHistory'] as String,
      petType: json['petType'] as String,
      petSex: json['petSex'] as String,
      petAge: json['petAge'] as String,
      petSize: json['petSize'] as String,
      postState: json['postState'] as String,
      vaccinated: json['vaccinated'] as bool,
      dewormed: json['dewormed'] as bool,
      neutered: json['neutered'] as bool,
      createdAt: DateTime.parse(json['createdAt'] as String),
      postOwner: PostOwner.fromJson(json['postOwner'] as Map<String, dynamic>),
      petImages:
          (json['petImages'] as List<dynamic>).map((e) => e as String).toList(),
    );

Map<String, dynamic> _$$PostImplToJson(_$PostImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'department': instance.department,
      'city': instance.city,
      'petName': instance.petName,
      'petHistory': instance.petHistory,
      'petType': instance.petType,
      'petSex': instance.petSex,
      'petAge': instance.petAge,
      'petSize': instance.petSize,
      'postState': instance.postState,
      'vaccinated': instance.vaccinated,
      'dewormed': instance.dewormed,
      'neutered': instance.neutered,
      'createdAt': instance.createdAt.toIso8601String(),
      'postOwner': instance.postOwner,
      'petImages': instance.petImages,
    };