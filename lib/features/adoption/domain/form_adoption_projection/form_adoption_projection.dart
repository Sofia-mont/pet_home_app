import 'package:freezed_annotation/freezed_annotation.dart';
part 'form_adoption_projection.freezed.dart';
part 'form_adoption_projection.g.dart';

@freezed
class FormAdoptionProjection with _$FormAdoptionProjection {
  factory FormAdoptionProjection({
    required int id,
    required DateTime sentAt,
    required String candidateFullName,
    required String postPetName,
  }) = _FormAdoptionProjection;

  factory FormAdoptionProjection.fromJson(Map<String, dynamic> json) =>
      _$FormAdoptionProjectionFromJson(json);
}
