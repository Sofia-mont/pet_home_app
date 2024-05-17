// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'postulation_search_query.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

PostulationSearchQuery _$PostulationSearchQueryFromJson(
    Map<String, dynamic> json) {
  return _PostulationSearchQuery.fromJson(json);
}

/// @nodoc
mixin _$PostulationSearchQuery {
  String? get status => throw _privateConstructorUsedError;
  String? get postId => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PostulationSearchQueryCopyWith<PostulationSearchQuery> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PostulationSearchQueryCopyWith<$Res> {
  factory $PostulationSearchQueryCopyWith(PostulationSearchQuery value,
          $Res Function(PostulationSearchQuery) then) =
      _$PostulationSearchQueryCopyWithImpl<$Res, PostulationSearchQuery>;
  @useResult
  $Res call({String? status, String? postId});
}

/// @nodoc
class _$PostulationSearchQueryCopyWithImpl<$Res,
        $Val extends PostulationSearchQuery>
    implements $PostulationSearchQueryCopyWith<$Res> {
  _$PostulationSearchQueryCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = freezed,
    Object? postId = freezed,
  }) {
    return _then(_value.copyWith(
      status: freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String?,
      postId: freezed == postId
          ? _value.postId
          : postId // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PostulationSearchQueryImplCopyWith<$Res>
    implements $PostulationSearchQueryCopyWith<$Res> {
  factory _$$PostulationSearchQueryImplCopyWith(
          _$PostulationSearchQueryImpl value,
          $Res Function(_$PostulationSearchQueryImpl) then) =
      __$$PostulationSearchQueryImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String? status, String? postId});
}

/// @nodoc
class __$$PostulationSearchQueryImplCopyWithImpl<$Res>
    extends _$PostulationSearchQueryCopyWithImpl<$Res,
        _$PostulationSearchQueryImpl>
    implements _$$PostulationSearchQueryImplCopyWith<$Res> {
  __$$PostulationSearchQueryImplCopyWithImpl(
      _$PostulationSearchQueryImpl _value,
      $Res Function(_$PostulationSearchQueryImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = freezed,
    Object? postId = freezed,
  }) {
    return _then(_$PostulationSearchQueryImpl(
      status: freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String?,
      postId: freezed == postId
          ? _value.postId
          : postId // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$PostulationSearchQueryImpl implements _PostulationSearchQuery {
  _$PostulationSearchQueryImpl({this.status, this.postId});

  factory _$PostulationSearchQueryImpl.fromJson(Map<String, dynamic> json) =>
      _$$PostulationSearchQueryImplFromJson(json);

  @override
  final String? status;
  @override
  final String? postId;

  @override
  String toString() {
    return 'PostulationSearchQuery(status: $status, postId: $postId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PostulationSearchQueryImpl &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.postId, postId) || other.postId == postId));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, status, postId);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$PostulationSearchQueryImplCopyWith<_$PostulationSearchQueryImpl>
      get copyWith => __$$PostulationSearchQueryImplCopyWithImpl<
          _$PostulationSearchQueryImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PostulationSearchQueryImplToJson(
      this,
    );
  }
}

abstract class _PostulationSearchQuery implements PostulationSearchQuery {
  factory _PostulationSearchQuery(
      {final String? status,
      final String? postId}) = _$PostulationSearchQueryImpl;

  factory _PostulationSearchQuery.fromJson(Map<String, dynamic> json) =
      _$PostulationSearchQueryImpl.fromJson;

  @override
  String? get status;
  @override
  String? get postId;
  @override
  @JsonKey(ignore: true)
  _$$PostulationSearchQueryImplCopyWith<_$PostulationSearchQueryImpl>
      get copyWith => throw _privateConstructorUsedError;
}
