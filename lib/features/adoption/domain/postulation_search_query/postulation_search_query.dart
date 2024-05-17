import 'package:freezed_annotation/freezed_annotation.dart';

part 'postulation_search_query.freezed.dart';
part 'postulation_search_query.g.dart';

@freezed
class PostulationSearchQuery with _$PostulationSearchQuery {
  factory PostulationSearchQuery({
    String? status,
    String? postId,
  }) = _PostulationSearchQuery;

  factory PostulationSearchQuery.fromJson(Map<String, dynamic> json) =>
      _$PostulationSearchQueryFromJson(json);
}
