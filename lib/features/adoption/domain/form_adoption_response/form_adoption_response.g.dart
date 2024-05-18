// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'form_adoption_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$FormAdoptionResponseImpl _$$FormAdoptionResponseImplFromJson(
        Map<String, dynamic> json) =>
    _$FormAdoptionResponseImpl(
      id: json['id'] as int,
      sentAt: DateTime.parse(json['sentAt'] as String),
      state: json['state'] as String,
      candidateInfo:
          CandidateInfo.fromJson(json['candidateInfo'] as Map<String, dynamic>),
      familyComposition: FamilyComposition.fromJson(
          json['familyComposition'] as Map<String, dynamic>),
      questionnaire:
          Questionnaire.fromJson(json['questionnaire'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$FormAdoptionResponseImplToJson(
        _$FormAdoptionResponseImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'sentAt': instance.sentAt.toIso8601String(),
      'state': instance.state,
      'candidateInfo': instance.candidateInfo,
      'familyComposition': instance.familyComposition,
      'questionnaire': instance.questionnaire,
    };
