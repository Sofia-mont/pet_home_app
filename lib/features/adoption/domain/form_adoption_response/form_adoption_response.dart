import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:pet_home/features/adoption/domain/candidate_info/candidate_info.dart';
import 'package:pet_home/features/adoption/domain/family_composition/family_composition.dart';
import 'package:pet_home/features/adoption/domain/questionnaire/questionnaire.dart';

part 'form_adoption_response.freezed.dart';
part 'form_adoption_response.g.dart';

@freezed
class FormAdoptionResponse with _$FormAdoptionResponse {
  factory FormAdoptionResponse({
    required int id,
    required DateTime sentAt,
    required String state,
    required CandidateInfo candidateInfo,
    required FamilyComposition familyComposition,
    required Questionnaire questionnaire,
  }) = _FormAdoptionResponse;

  factory FormAdoptionResponse.fromJson(Map<String, dynamic> json) =>
      _$FormAdoptionResponseFromJson(json);
}
