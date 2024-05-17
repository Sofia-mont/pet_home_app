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
  int get getId => throw _privateConstructorUsedError;
  DateTime get getSentAt => throw _privateConstructorUsedError;
  String get getCandidateFullName => throw _privateConstructorUsedError;
  String get getPostPetName => throw _privateConstructorUsedError;

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
      {int getId,
      DateTime getSentAt,
      String getCandidateFullName,
      String getPostPetName});
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
    Object? getId = null,
    Object? getSentAt = null,
    Object? getCandidateFullName = null,
    Object? getPostPetName = null,
  }) {
    return _then(_value.copyWith(
      getId: null == getId
          ? _value.getId
          : getId // ignore: cast_nullable_to_non_nullable
              as int,
      getSentAt: null == getSentAt
          ? _value.getSentAt
          : getSentAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      getCandidateFullName: null == getCandidateFullName
          ? _value.getCandidateFullName
          : getCandidateFullName // ignore: cast_nullable_to_non_nullable
              as String,
      getPostPetName: null == getPostPetName
          ? _value.getPostPetName
          : getPostPetName // ignore: cast_nullable_to_non_nullable
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
      {int getId,
      DateTime getSentAt,
      String getCandidateFullName,
      String getPostPetName});
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
    Object? getId = null,
    Object? getSentAt = null,
    Object? getCandidateFullName = null,
    Object? getPostPetName = null,
  }) {
    return _then(_$FormAdoptionProjectionImpl(
      getId: null == getId
          ? _value.getId
          : getId // ignore: cast_nullable_to_non_nullable
              as int,
      getSentAt: null == getSentAt
          ? _value.getSentAt
          : getSentAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      getCandidateFullName: null == getCandidateFullName
          ? _value.getCandidateFullName
          : getCandidateFullName // ignore: cast_nullable_to_non_nullable
              as String,
      getPostPetName: null == getPostPetName
          ? _value.getPostPetName
          : getPostPetName // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$FormAdoptionProjectionImpl implements _FormAdoptionProjection {
  _$FormAdoptionProjectionImpl(
      {required this.getId,
      required this.getSentAt,
      required this.getCandidateFullName,
      required this.getPostPetName});

  factory _$FormAdoptionProjectionImpl.fromJson(Map<String, dynamic> json) =>
      _$$FormAdoptionProjectionImplFromJson(json);

  @override
  final int getId;
  @override
  final DateTime getSentAt;
  @override
  final String getCandidateFullName;
  @override
  final String getPostPetName;

  @override
  String toString() {
    return 'FormAdoptionProjection(getId: $getId, getSentAt: $getSentAt, getCandidateFullName: $getCandidateFullName, getPostPetName: $getPostPetName)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FormAdoptionProjectionImpl &&
            (identical(other.getId, getId) || other.getId == getId) &&
            (identical(other.getSentAt, getSentAt) ||
                other.getSentAt == getSentAt) &&
            (identical(other.getCandidateFullName, getCandidateFullName) ||
                other.getCandidateFullName == getCandidateFullName) &&
            (identical(other.getPostPetName, getPostPetName) ||
                other.getPostPetName == getPostPetName));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, getId, getSentAt, getCandidateFullName, getPostPetName);

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
      {required final int getId,
      required final DateTime getSentAt,
      required final String getCandidateFullName,
      required final String getPostPetName}) = _$FormAdoptionProjectionImpl;

  factory _FormAdoptionProjection.fromJson(Map<String, dynamic> json) =
      _$FormAdoptionProjectionImpl.fromJson;

  @override
  int get getId;
  @override
  DateTime get getSentAt;
  @override
  String get getCandidateFullName;
  @override
  String get getPostPetName;
  @override
  @JsonKey(ignore: true)
  _$$FormAdoptionProjectionImplCopyWith<_$FormAdoptionProjectionImpl>
      get copyWith => throw _privateConstructorUsedError;
}
