import 'package:equatable/equatable.dart';
import 'package:pet_home/features/adoption/domain/candidate_info.dart';
import 'package:pet_home/features/adoption/domain/family_composition.dart';
import 'package:pet_home/features/adoption/domain/questionnaire.dart';

class FormAdoptionResponse extends Equatable {
  const FormAdoptionResponse({
    required this.id,
    required this.sentAt,
    required this.state,
    required this.candidateInfo,
    required this.familyComposition,
    required this.questionnaire,
  });

  final int id;
  final DateTime? sentAt;
  final String state;
  final CandidateInfo candidateInfo;
  final FamilyComposition familyComposition;
  final Questionnaire questionnaire;

  FormAdoptionResponse copyWith({
    int? id,
    DateTime? sentAt,
    String? state,
    CandidateInfo? candidateInfo,
    FamilyComposition? familyComposition,
    Questionnaire? questionnaire,
  }) {
    return FormAdoptionResponse(
      id: id ?? this.id,
      sentAt: sentAt ?? this.sentAt,
      state: state ?? this.state,
      candidateInfo: candidateInfo ?? this.candidateInfo,
      familyComposition: familyComposition ?? this.familyComposition,
      questionnaire: questionnaire ?? this.questionnaire,
    );
  }

  factory FormAdoptionResponse.fromJson(Map<String, dynamic> json) {
    return FormAdoptionResponse(
      id: json['id'] ?? 0,
      sentAt: DateTime.tryParse(json['sentAt'] ?? ''),
      state: json['state'] ?? '',
      candidateInfo: CandidateInfo.fromJson(json['candidateInfo']),
      familyComposition: FamilyComposition.fromJson(json['familyComposition']),
      questionnaire: Questionnaire.fromJson(json['questionnaire']),
    );
  }

  Map<String, dynamic> toJson() => {
        'id': id,
        'sentAt': sentAt?.toIso8601String(),
        'state': state,
        'candidateInfo': candidateInfo.toJson(),
        'familyComposition': familyComposition.toJson(),
        'questionnaire': questionnaire.toJson(),
      };

  @override
  String toString() {
    return '$id, $sentAt, $state, $candidateInfo, $familyComposition, $questionnaire, ';
  }

  @override
  List<Object?> get props => [
        id,
        sentAt,
        state,
        candidateInfo,
        familyComposition,
        questionnaire,
      ];
}
