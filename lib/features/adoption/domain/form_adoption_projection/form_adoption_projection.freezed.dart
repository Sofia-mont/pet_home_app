// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'form_adoption_projection.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

FormAdoptionProjection _$FormAdoptionProjectionFromJson(
    Map<String, dynamic> json) {
  return _FormAdoptionProjection.fromJson(json);
}

/// @nodoc
mixin _$FormAdoptionProjection {
  int get id => throw _privateConstructorUsedError;
  DateTime get sentAt => throw _privateConstructorUsedError;
  String get candidateFullName => throw _privateConstructorUsedError;
  String get postPetName => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $FormAdoptionProjectionCopyWith<FormAdoptionProjection> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FormAdoptionProjectionCopyWith<$Res> {
  factory $FormAdoptionProjectionCopyWith(FormAdoptionProjection value,
          $Res Function(FormAdoptionProjection) then) =
      _$FormAdoptionProjectionCopyWithImpl<$Res, FormAdoptionProjection>;
  @useResult
  $Res call(
      {int id, DateTime sentAt, String candidateFullName, String postPetName});
}

/// @nodoc
class _$FormAdoptionProjectionCopyWithImpl<$Res,
        $Val extends FormAdoptionProjection>
    implements $FormAdoptionProjectionCopyWith<$Res> {
  _$FormAdoptionProjectionCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? sentAt = null,
    Object? candidateFullName = null,
    Object? postPetName = null,
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
      candidateFullName: null == candidateFullName
          ? _value.candidateFullName
          : candidateFullName // ignore: cast_nullable_to_non_nullable
              as String,
      postPetName: null == postPetName
          ? _value.postPetName
          : postPetName // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$FormAdoptionProjectionImplCopyWith<$Res>
    implements $FormAdoptionProjectionCopyWith<$Res> {
  factory _$$FormAdoptionProjectionImplCopyWith(
          _$FormAdoptionProjectionImpl value,
          $Res Function(_$FormAdoptionProjectionImpl) then) =
      __$$FormAdoptionProjectionImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int id, DateTime sentAt, String candidateFullName, String postPetName});
}

/// @nodoc
class __$$FormAdoptionProjectionImplCopyWithImpl<$Res>
    extends _$FormAdoptionProjectionCopyWithImpl<$Res,
        _$FormAdoptionProjectionImpl>
    implements _$$FormAdoptionProjectionImplCopyWith<$Res> {
  __$$FormAdoptionProjectionImplCopyWithImpl(
      _$FormAdoptionProjectionImpl _value,
      $Res Function(_$FormAdoptionProjectionImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? sentAt = null,
    Object? candidateFullName = null,
    Object? postPetName = null,
  }) {
    return _then(_$FormAdoptionProjectionImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      sentAt: null == sentAt
          ? _value.sentAt
          : sentAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      candidateFullName: null == candidateFullName
          ? _value.candidateFullName
          : candidateFullName // ignore: cast_nullable_to_non_nullable
              as String,
      postPetName: null == postPetName
          ? _value.postPetName
          : postPetName // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$FormAdoptionProjectionImpl implements _FormAdoptionProjection {
  _$FormAdoptionProjectionImpl(
      {required this.id,
      required this.sentAt,
      required this.candidateFullName,
      required this.postPetName});

  factory _$FormAdoptionProjectionImpl.fromJson(Map<String, dynamic> json) =>
      _$$FormAdoptionProjectionImplFromJson(json);

  @override
  final int id;
  @override
  final DateTime sentAt;
  @override
  final String candidateFullName;
  @override
  final String postPetName;

  @override
  String toString() {
    return 'FormAdoptionProjection(id: $id, sentAt: $sentAt, candidateFullName: $candidateFullName, postPetName: $postPetName)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FormAdoptionProjectionImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.sentAt, sentAt) || other.sentAt == sentAt) &&
            (identical(other.candidateFullName, candidateFullName) ||
                other.candidateFullName == candidateFullName) &&
            (identical(other.postPetName, postPetName) ||
                other.postPetName == postPetName));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, id, sentAt, candidateFullName, postPetName);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$FormAdoptionProjectionImplCopyWith<_$FormAdoptionProjectionImpl>
      get copyWith => __$$FormAdoptionProjectionImplCopyWithImpl<
          _$FormAdoptionProjectionImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$FormAdoptionProjectionImplToJson(
      this,
    );
  }
}

abstract class _FormAdoptionProjection implements FormAdoptionProjection {
  factory _FormAdoptionProjection(
      {required final int id,
      required final DateTime sentAt,
      required final String candidateFullName,
      required final String postPetName}) = _$FormAdoptionProjectionImpl;

  factory _FormAdoptionProjection.fromJson(Map<String, dynamic> json) =
      _$FormAdoptionProjectionImpl.fromJson;

  @override
  int get id;
  @override
  DateTime get sentAt;
  @override
  String get candidateFullName;
  @override
  String get postPetName;
  @override
  @JsonKey(ignore: true)
  _$$FormAdoptionProjectionImplCopyWith<_$FormAdoptionProjectionImpl>
      get copyWith => throw _privateConstructorUsedError;
}
