// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'form_adoption_request.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

FormAdoptionRequest _$FormAdoptionRequestFromJson(Map<String, dynamic> json) {
  return _FormAdoptionRequest.fromJson(json);
}

/// @nodoc
mixin _$FormAdoptionRequest {
  CandidateInfo? get candidateInfo => throw _privateConstructorUsedError;
  FamilyComposition? get familyComposition =>
      throw _privateConstructorUsedError;
  Questionnaire? get questionnaire => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $FormAdoptionRequestCopyWith<FormAdoptionRequest> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FormAdoptionRequestCopyWith<$Res> {
  factory $FormAdoptionRequestCopyWith(
          FormAdoptionRequest value, $Res Function(FormAdoptionRequest) then) =
      _$FormAdoptionRequestCopyWithImpl<$Res, FormAdoptionRequest>;
  @useResult
  $Res call(
      {CandidateInfo? candidateInfo,
      FamilyComposition? familyComposition,
      Questionnaire? questionnaire});

  $CandidateInfoCopyWith<$Res>? get candidateInfo;
  $FamilyCompositionCopyWith<$Res>? get familyComposition;
  $QuestionnaireCopyWith<$Res>? get questionnaire;
}

/// @nodoc
class _$FormAdoptionRequestCopyWithImpl<$Res, $Val extends FormAdoptionRequest>
    implements $FormAdoptionRequestCopyWith<$Res> {
  _$FormAdoptionRequestCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? candidateInfo = freezed,
    Object? familyComposition = freezed,
    Object? questionnaire = freezed,
  }) {
    return _then(_value.copyWith(
      candidateInfo: freezed == candidateInfo
          ? _value.candidateInfo
          : candidateInfo // ignore: cast_nullable_to_non_nullable
              as CandidateInfo?,
      familyComposition: freezed == familyComposition
          ? _value.familyComposition
          : familyComposition // ignore: cast_nullable_to_non_nullable
              as FamilyComposition?,
      questionnaire: freezed == questionnaire
          ? _value.questionnaire
          : questionnaire // ignore: cast_nullable_to_non_nullable
              as Questionnaire?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $CandidateInfoCopyWith<$Res>? get candidateInfo {
    if (_value.candidateInfo == null) {
      return null;
    }

    return $CandidateInfoCopyWith<$Res>(_value.candidateInfo!, (value) {
      return _then(_value.copyWith(candidateInfo: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $FamilyCompositionCopyWith<$Res>? get familyComposition {
    if (_value.familyComposition == null) {
      return null;
    }

    return $FamilyCompositionCopyWith<$Res>(_value.familyComposition!, (value) {
      return _then(_value.copyWith(familyComposition: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $QuestionnaireCopyWith<$Res>? get questionnaire {
    if (_value.questionnaire == null) {
      return null;
    }

    return $QuestionnaireCopyWith<$Res>(_value.questionnaire!, (value) {
      return _then(_value.copyWith(questionnaire: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$FormAdoptionRequestImplCopyWith<$Res>
    implements $FormAdoptionRequestCopyWith<$Res> {
  factory _$$FormAdoptionRequestImplCopyWith(_$FormAdoptionRequestImpl value,
          $Res Function(_$FormAdoptionRequestImpl) then) =
      __$$FormAdoptionRequestImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {CandidateInfo? candidateInfo,
      FamilyComposition? familyComposition,
      Questionnaire? questionnaire});

  @override
  $CandidateInfoCopyWith<$Res>? get candidateInfo;
  @override
  $FamilyCompositionCopyWith<$Res>? get familyComposition;
  @override
  $QuestionnaireCopyWith<$Res>? get questionnaire;
}

/// @nodoc
class __$$FormAdoptionRequestImplCopyWithImpl<$Res>
    extends _$FormAdoptionRequestCopyWithImpl<$Res, _$FormAdoptionRequestImpl>
    implements _$$FormAdoptionRequestImplCopyWith<$Res> {
  __$$FormAdoptionRequestImplCopyWithImpl(_$FormAdoptionRequestImpl _value,
      $Res Function(_$FormAdoptionRequestImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? candidateInfo = freezed,
    Object? familyComposition = freezed,
    Object? questionnaire = freezed,
  }) {
    return _then(_$FormAdoptionRequestImpl(
      candidateInfo: freezed == candidateInfo
          ? _value.candidateInfo
          : candidateInfo // ignore: cast_nullable_to_non_nullable
              as CandidateInfo?,
      familyComposition: freezed == familyComposition
          ? _value.familyComposition
          : familyComposition // ignore: cast_nullable_to_non_nullable
              as FamilyComposition?,
      questionnaire: freezed == questionnaire
          ? _value.questionnaire
          : questionnaire // ignore: cast_nullable_to_non_nullable
              as Questionnaire?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$FormAdoptionRequestImpl implements _FormAdoptionRequest {
  _$FormAdoptionRequestImpl(
      {this.candidateInfo, this.familyComposition, this.questionnaire});

  factory _$FormAdoptionRequestImpl.fromJson(Map<String, dynamic> json) =>
      _$$FormAdoptionRequestImplFromJson(json);

  @override
  final CandidateInfo? candidateInfo;
  @override
  final FamilyComposition? familyComposition;
  @override
  final Questionnaire? questionnaire;

  @override
  String toString() {
    return 'FormAdoptionRequest(candidateInfo: $candidateInfo, familyComposition: $familyComposition, questionnaire: $questionnaire)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FormAdoptionRequestImpl &&
            (identical(other.candidateInfo, candidateInfo) ||
                other.candidateInfo == candidateInfo) &&
            (identical(other.familyComposition, familyComposition) ||
                other.familyComposition == familyComposition) &&
            (identical(other.questionnaire, questionnaire) ||
                other.questionnaire == questionnaire));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, candidateInfo, familyComposition, questionnaire);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$FormAdoptionRequestImplCopyWith<_$FormAdoptionRequestImpl> get copyWith =>
      __$$FormAdoptionRequestImplCopyWithImpl<_$FormAdoptionRequestImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$FormAdoptionRequestImplToJson(
      this,
    );
  }
}

abstract class _FormAdoptionRequest implements FormAdoptionRequest {
  factory _FormAdoptionRequest(
      {final CandidateInfo? candidateInfo,
      final FamilyComposition? familyComposition,
      final Questionnaire? questionnaire}) = _$FormAdoptionRequestImpl;

  factory _FormAdoptionRequest.fromJson(Map<String, dynamic> json) =
      _$FormAdoptionRequestImpl.fromJson;

  @override
  CandidateInfo? get candidateInfo;
  @override
  FamilyComposition? get familyComposition;
  @override
  Questionnaire? get questionnaire;
  @override
  @JsonKey(ignore: true)
  _$$FormAdoptionRequestImplCopyWith<_$FormAdoptionRequestImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
