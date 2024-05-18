// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'form_adoption_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

FormAdoptionResponse _$FormAdoptionResponseFromJson(Map<String, dynamic> json) {
  return _FormAdoptionResponse.fromJson(json);
}

/// @nodoc
mixin _$FormAdoptionResponse {
  int get id => throw _privateConstructorUsedError;
  DateTime get sentAt => throw _privateConstructorUsedError;
  String get state => throw _privateConstructorUsedError;
  CandidateInfo get candidateInfo => throw _privateConstructorUsedError;
  FamilyComposition get familyComposition => throw _privateConstructorUsedError;
  Questionnaire get questionnaire => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $FormAdoptionResponseCopyWith<FormAdoptionResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FormAdoptionResponseCopyWith<$Res> {
  factory $FormAdoptionResponseCopyWith(FormAdoptionResponse value,
          $Res Function(FormAdoptionResponse) then) =
      _$FormAdoptionResponseCopyWithImpl<$Res, FormAdoptionResponse>;
  @useResult
  $Res call(
      {int id,
      DateTime sentAt,
      String state,
      CandidateInfo candidateInfo,
      FamilyComposition familyComposition,
      Questionnaire questionnaire});

  $CandidateInfoCopyWith<$Res> get candidateInfo;
  $FamilyCompositionCopyWith<$Res> get familyComposition;
  $QuestionnaireCopyWith<$Res> get questionnaire;
}

/// @nodoc
class _$FormAdoptionResponseCopyWithImpl<$Res,
        $Val extends FormAdoptionResponse>
    implements $FormAdoptionResponseCopyWith<$Res> {
  _$FormAdoptionResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? sentAt = null,
    Object? state = null,
    Object? candidateInfo = null,
    Object? familyComposition = null,
    Object? questionnaire = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      sentAt: null == sentAt
          ? _value.sentAt
          : sentAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      state: null == state
          ? _value.state
          : state // ignore: cast_nullable_to_non_nullable
              as String,
      candidateInfo: null == candidateInfo
          ? _value.candidateInfo
          : candidateInfo // ignore: cast_nullable_to_non_nullable
              as CandidateInfo,
      familyComposition: null == familyComposition
          ? _value.familyComposition
          : familyComposition // ignore: cast_nullable_to_non_nullable
              as FamilyComposition,
      questionnaire: null == questionnaire
          ? _value.questionnaire
          : questionnaire // ignore: cast_nullable_to_non_nullable
              as Questionnaire,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $CandidateInfoCopyWith<$Res> get candidateInfo {
    return $CandidateInfoCopyWith<$Res>(_value.candidateInfo, (value) {
      return _then(_value.copyWith(candidateInfo: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $FamilyCompositionCopyWith<$Res> get familyComposition {
    return $FamilyCompositionCopyWith<$Res>(_value.familyComposition, (value) {
      return _then(_value.copyWith(familyComposition: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $QuestionnaireCopyWith<$Res> get questionnaire {
    return $QuestionnaireCopyWith<$Res>(_value.questionnaire, (value) {
      return _then(_value.copyWith(questionnaire: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$FormAdoptionResponseImplCopyWith<$Res>
    implements $FormAdoptionResponseCopyWith<$Res> {
  factory _$$FormAdoptionResponseImplCopyWith(_$FormAdoptionResponseImpl value,
          $Res Function(_$FormAdoptionResponseImpl) then) =
      __$$FormAdoptionResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int id,
      DateTime sentAt,
      String state,
      CandidateInfo candidateInfo,
      FamilyComposition familyComposition,
      Questionnaire questionnaire});

  @override
  $CandidateInfoCopyWith<$Res> get candidateInfo;
  @override
  $FamilyCompositionCopyWith<$Res> get familyComposition;
  @override
  $QuestionnaireCopyWith<$Res> get questionnaire;
}

/// @nodoc
class __$$FormAdoptionResponseImplCopyWithImpl<$Res>
    extends _$FormAdoptionResponseCopyWithImpl<$Res, _$FormAdoptionResponseImpl>
    implements _$$FormAdoptionResponseImplCopyWith<$Res> {
  __$$FormAdoptionResponseImplCopyWithImpl(_$FormAdoptionResponseImpl _value,
      $Res Function(_$FormAdoptionResponseImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? sentAt = null,
    Object? state = null,
    Object? candidateInfo = null,
    Object? familyComposition = null,
    Object? questionnaire = null,
  }) {
    return _then(_$FormAdoptionResponseImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      sentAt: null == sentAt
          ? _value.sentAt
          : sentAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      state: null == state
          ? _value.state
          : state // ignore: cast_nullable_to_non_nullable
              as String,
      candidateInfo: null == candidateInfo
          ? _value.candidateInfo
          : candidateInfo // ignore: cast_nullable_to_non_nullable
              as CandidateInfo,
      familyComposition: null == familyComposition
          ? _value.familyComposition
          : familyComposition // ignore: cast_nullable_to_non_nullable
              as FamilyComposition,
      questionnaire: null == questionnaire
          ? _value.questionnaire
          : questionnaire // ignore: cast_nullable_to_non_nullable
              as Questionnaire,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$FormAdoptionResponseImpl implements _FormAdoptionResponse {
  _$FormAdoptionResponseImpl(
      {required this.id,
      required this.sentAt,
      required this.state,
      required this.candidateInfo,
      required this.familyComposition,
      required this.questionnaire});

  factory _$FormAdoptionResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$FormAdoptionResponseImplFromJson(json);

  @override
  final int id;
  @override
  final DateTime sentAt;
  @override
  final String state;
  @override
  final CandidateInfo candidateInfo;
  @override
  final FamilyComposition familyComposition;
  @override
  final Questionnaire questionnaire;

  @override
  String toString() {
    return 'FormAdoptionResponse(id: $id, sentAt: $sentAt, state: $state, candidateInfo: $candidateInfo, familyComposition: $familyComposition, questionnaire: $questionnaire)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FormAdoptionResponseImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.sentAt, sentAt) || other.sentAt == sentAt) &&
            (identical(other.state, state) || other.state == state) &&
            (identical(other.candidateInfo, candidateInfo) ||
                other.candidateInfo == candidateInfo) &&
            (identical(other.familyComposition, familyComposition) ||
                other.familyComposition == familyComposition) &&
            (identical(other.questionnaire, questionnaire) ||
                other.questionnaire == questionnaire));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, sentAt, state, candidateInfo,
      familyComposition, questionnaire);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$FormAdoptionResponseImplCopyWith<_$FormAdoptionResponseImpl>
      get copyWith =>
          __$$FormAdoptionResponseImplCopyWithImpl<_$FormAdoptionResponseImpl>(
              this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$FormAdoptionResponseImplToJson(
      this,
    );
  }
}

abstract class _FormAdoptionResponse implements FormAdoptionResponse {
  factory _FormAdoptionResponse(
      {required final int id,
      required final DateTime sentAt,
      required final String state,
      required final CandidateInfo candidateInfo,
      required final FamilyComposition familyComposition,
      required final Questionnaire questionnaire}) = _$FormAdoptionResponseImpl;

  factory _FormAdoptionResponse.fromJson(Map<String, dynamic> json) =
      _$FormAdoptionResponseImpl.fromJson;

  @override
  int get id;
  @override
  DateTime get sentAt;
  @override
  String get state;
  @override
  CandidateInfo get candidateInfo;
  @override
  FamilyComposition get familyComposition;
  @override
  Questionnaire get questionnaire;
  @override
  @JsonKey(ignore: true)
  _$$FormAdoptionResponseImplCopyWith<_$FormAdoptionResponseImpl>
      get copyWith => throw _privateConstructorUsedError;
}
