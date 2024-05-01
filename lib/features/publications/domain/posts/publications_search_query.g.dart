// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'publications_search_query.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$PublicationsResponseQueryImpl _$$PublicationsResponseQueryImplFromJson(
        Map<String, dynamic> json) =>
    _$PublicationsResponseQueryImpl(
      petType: json['petType'] as String?,
      petSex: json['petSex'] as String?,
      petSize: json['petSize'] as String?,
      department: json['department'] as String?,
      city: json['city'] as String?,
    );

Map<String, dynamic> _$$PublicationsResponseQueryImplToJson(
        _$PublicationsResponseQueryImpl instance) =>
    <String, dynamic>{
      'petType': instance.petType,
      'petSex': instance.petSex,
      'petSize': instance.petSize,
      'department': instance.department,
      'city': instance.city,
    };
