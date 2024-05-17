import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:pet_home/features/adoption/domain/candidate_info/candidate_info.dart';
import 'package:pet_home/features/adoption/domain/family_composition/family_composition.dart';
import 'package:pet_home/features/adoption/domain/questionnaire/questionnaire.dart';

part 'form_adoption_request.freezed.dart';
part 'form_adoption_request.g.dart';

@freezed
class FormAdoptionRequest with _$FormAdoptionRequest {
  factory FormAdoptionRequest({
    CandidateInfo? candidateInfo,
    FamilyComposition? familyComposition,
    Questionnaire? questionnaire,
  }) = _FormAdoptionRequest;

  factory FormAdoptionRequest.fromJson(Map<String, dynamic> json) =>
      _$FormAdoptionRequestFromJson(json);
}
