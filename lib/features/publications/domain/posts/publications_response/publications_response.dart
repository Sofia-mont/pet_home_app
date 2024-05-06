import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:pet_home/features/publications/domain/post/post/post.dart';

part 'publications_response.freezed.dart';
part 'publications_response.g.dart';

@freezed
class PublicationsResponse with _$PublicationsResponse {
  factory PublicationsResponse({
    @JsonKey(name: 'data') required List<Post> data,
    @JsonKey(name: 'actualPage') required int actualPage,
    @JsonKey(name: 'totalPages') required int totalPages,
    @JsonKey(name: 'last') required bool last,
    @Default([]) List<String> errors,
  }) = _PublicationsResponse;

  factory PublicationsResponse.fromJson(Map<String, dynamic> json) =>
      _$PublicationsResponseFromJson(json);
}

extension PublicationsResponseX on PublicationsResponse {
  bool get isEmpty => !hasResults();

  bool hasResults() {
    return data.isNotEmpty;
  }

  bool hasErrors() {
    return errors.isNotEmpty;
  }
}
