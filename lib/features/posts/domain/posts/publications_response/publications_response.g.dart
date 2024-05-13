// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'publications_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$PublicationsResponseImpl _$$PublicationsResponseImplFromJson(
        Map<String, dynamic> json) =>
    _$PublicationsResponseImpl(
      data: (json['data'] as List<dynamic>)
          .map((e) => Post.fromJson(e as Map<String, dynamic>))
          .toList(),
      actualPage: json['actualPage'] as int,
      totalPages: json['totalPages'] as int,
      last: json['last'] as bool,
      pageSize: json['pageSize'] as int,
      totalResults: json['totalResults'] as int,
      errors: (json['errors'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
    );

Map<String, dynamic> _$$PublicationsResponseImplToJson(
        _$PublicationsResponseImpl instance) =>
    <String, dynamic>{
      'data': instance.data,
      'actualPage': instance.actualPage,
      'totalPages': instance.totalPages,
      'last': instance.last,
      'pageSize': instance.pageSize,
      'totalResults': instance.totalResults,
      'errors': instance.errors,
    };
