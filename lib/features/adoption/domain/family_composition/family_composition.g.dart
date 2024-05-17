// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'family_composition.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$FamilyCompositionImpl _$$FamilyCompositionImplFromJson(
        Map<String, dynamic> json) =>
    _$FamilyCompositionImpl(
      adultsHome: json['adultsHome'] as int,
      kidsHome: json['kidsHome'] as int,
      babiesHome: json['babiesHome'] as int,
      ages: json['ages'] as String,
      composition: json['composition'] as String,
    );

Map<String, dynamic> _$$FamilyCompositionImplToJson(
        _$FamilyCompositionImpl instance) =>
    <String, dynamic>{
      'adultsHome': instance.adultsHome,
      'kidsHome': instance.kidsHome,
      'babiesHome': instance.babiesHome,
      'ages': instance.ages,
      'composition': instance.composition,
    };
