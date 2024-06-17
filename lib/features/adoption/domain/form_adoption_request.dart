import 'package:equatable/equatable.dart';
import 'package:pet_home/features/adoption/domain/candidate_info.dart';
import 'package:pet_home/features/adoption/domain/family_composition.dart';
import 'package:pet_home/features/adoption/domain/questionnaire.dart';

class FormAdoptionRequest extends Equatable {
  const FormAdoptionRequest({
    this.candidateInfo,
    this.familyComposition,
    this.questionnaire,
  });

  final CandidateInfo? candidateInfo;
  final FamilyComposition? familyComposition;
  final Questionnaire? questionnaire;

  FormAdoptionRequest copyWith({
    CandidateInfo? candidateInfo,
    FamilyComposition? familyComposition,
    Questionnaire? questionnaire,
  }) {
    return FormAdoptionRequest(
      candidateInfo: candidateInfo ?? this.candidateInfo,
      familyComposition: familyComposition ?? this.familyComposition,
      questionnaire: questionnaire ?? this.questionnaire,
    );
  }

  factory FormAdoptionRequest.fromJson(Map<String, dynamic> json) {
    return FormAdoptionRequest(
      candidateInfo: json['candidateInfo'] == null
          ? null
          : CandidateInfo.fromJson(json['candidateInfo']),
      familyComposition: json['familyComposition'] == null
          ? null
          : FamilyComposition.fromJson(json['familyComposition']),
      questionnaire: json['questionnaire'] == null
          ? null
          : Questionnaire.fromJson(json['questionnaire']),
    );
  }

  Map<String, dynamic> toJson() => {
        'candidateInfo': candidateInfo?.toJson(),
        'familyComposition': familyComposition?.toJson(),
        'questionnaire': questionnaire?.toJson(),
      };

  @override
  String toString() {
    return '$candidateInfo, $familyComposition, $questionnaire, ';
  }

  @override
  List<Object?> get props => [
        candidateInfo,
        familyComposition,
        questionnaire,
      ];
}
