// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'post_owner.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

PostOwner _$PostOwnerFromJson(Map<String, dynamic> json) {
  return _PostOwner.fromJson(json);
}

/// @nodoc
mixin _$PostOwner {
  int get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String get userType => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PostOwnerCopyWith<PostOwner> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PostOwnerCopyWith<$Res> {
  factory $PostOwnerCopyWith(PostOwner value, $Res Function(PostOwner) then) =
      _$PostOwnerCopyWithImpl<$Res, PostOwner>;
  @useResult
  $Res call({int id, String name, String userType});
}

/// @nodoc
class _$PostOwnerCopyWithImpl<$Res, $Val extends PostOwner>
    implements $PostOwnerCopyWith<$Res> {
  _$PostOwnerCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? userType = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      userType: null == userType
          ? _value.userType
          : userType // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PostOwnerImplCopyWith<$Res>
    implements $PostOwnerCopyWith<$Res> {
  factory _$$PostOwnerImplCopyWith(
          _$PostOwnerImpl value, $Res Function(_$PostOwnerImpl) then) =
      __$$PostOwnerImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int id, String name, String userType});
}

/// @nodoc
class __$$PostOwnerImplCopyWithImpl<$Res>
    extends _$PostOwnerCopyWithImpl<$Res, _$PostOwnerImpl>
    implements _$$PostOwnerImplCopyWith<$Res> {
  __$$PostOwnerImplCopyWithImpl(
      _$PostOwnerImpl _value, $Res Function(_$PostOwnerImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? userType = null,
  }) {
    return _then(_$PostOwnerImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      userType: null == userType
          ? _value.userType
          : userType // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$PostOwnerImpl implements _PostOwner {
  _$PostOwnerImpl(
      {required this.id, required this.name, required this.userType});

  factory _$PostOwnerImpl.fromJson(Map<String, dynamic> json) =>
      _$$PostOwnerImplFromJson(json);

  @override
  final int id;
  @override
  final String name;
  @override
  final String userType;

  @override
  String toString() {
    return 'PostOwner(id: $id, name: $name, userType: $userType)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PostOwnerImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.userType, userType) ||
                other.userType == userType));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, name, userType);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$PostOwnerImplCopyWith<_$PostOwnerImpl> get copyWith =>
      __$$PostOwnerImplCopyWithImpl<_$PostOwnerImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PostOwnerImplToJson(
      this,
    );
  }
}

abstract class _PostOwner implements PostOwner {
  factory _PostOwner(
      {required final int id,
      required final String name,
      required final String userType}) = _$PostOwnerImpl;

  factory _PostOwner.fromJson(Map<String, dynamic> json) =
      _$PostOwnerImpl.fromJson;

  @override
  int get id;
  @override
  String get name;
  @override
  String get userType;
  @override
  @JsonKey(ignore: true)
  _$$PostOwnerImplCopyWith<_$PostOwnerImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
