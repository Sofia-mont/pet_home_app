import 'package:freezed_annotation/freezed_annotation.dart';

part 'publications_search_query.freezed.dart';
part 'publications_search_query.g.dart';

@freezed
class PublicationsResponseQuery with _$PublicationsResponseQuery {
  factory PublicationsResponseQuery({
    String? petType,
    String? petSex,
    String? petSize,
    String? department,
    String? city,
  }) = _PublicationsResponseQuery;

  factory PublicationsResponseQuery.fromJson(Map<String, dynamic> json) =>
      _$PublicationsResponseQueryFromJson(json);
}
