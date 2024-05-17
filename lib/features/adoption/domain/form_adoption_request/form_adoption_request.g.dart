// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'form_adoption_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$FormAdoptionRequestImpl _$$FormAdoptionRequestImplFromJson(
        Map<String, dynamic> json) =>
    _$FormAdoptionRequestImpl(
      candidateInfo: json['candidateInfo'] == null
          ? null
          : CandidateInfo.fromJson(
              json['candidateInfo'] as Map<String, dynamic>),
      familyComposition: json['familyComposition'] == null
          ? null
          : FamilyComposition.fromJson(
              json['familyComposition'] as Map<String, dynamic>),
      questionnaire: json['questionnaire'] == null
          ? null
          : Questionnaire.fromJson(
              json['questionnaire'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$FormAdoptionRequestImplToJson(
        _$FormAdoptionRequestImpl instance) =>
    <String, dynamic>{
      'candidateInfo': instance.candidateInfo,
      'familyComposition': instance.familyComposition,
      'questionnaire': instance.questionnaire,
    };
