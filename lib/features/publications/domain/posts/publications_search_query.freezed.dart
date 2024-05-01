// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'publications_search_query.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

PublicationsResponseQuery _$PublicationsResponseQueryFromJson(
    Map<String, dynamic> json) {
  return _PublicationsResponseQuery.fromJson(json);
}

/// @nodoc
mixin _$PublicationsResponseQuery {
  String? get petType => throw _privateConstructorUsedError;
  String? get petSex => throw _privateConstructorUsedError;
  String? get petSize => throw _privateConstructorUsedError;
  String? get department => throw _privateConstructorUsedError;
  String? get city => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PublicationsResponseQueryCopyWith<PublicationsResponseQuery> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PublicationsResponseQueryCopyWith<$Res> {
  factory $PublicationsResponseQueryCopyWith(PublicationsResponseQuery value,
          $Res Function(PublicationsResponseQuery) then) =
      _$PublicationsResponseQueryCopyWithImpl<$Res, PublicationsResponseQuery>;
  @useResult
  $Res call(
      {String? petType,
      String? petSex,
      String? petSize,
      String? department,
      String? city});
}

/// @nodoc
class _$PublicationsResponseQueryCopyWithImpl<$Res,
        $Val extends PublicationsResponseQuery>
    implements $PublicationsResponseQueryCopyWith<$Res> {
  _$PublicationsResponseQueryCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? petType = freezed,
    Object? petSex = freezed,
    Object? petSize = freezed,
    Object? department = freezed,
    Object? city = freezed,
  }) {
    return _then(_value.copyWith(
      petType: freezed == petType
          ? _value.petType
          : petType // ignore: cast_nullable_to_non_nullable
              as String?,
      petSex: freezed == petSex
          ? _value.petSex
          : petSex // ignore: cast_nullable_to_non_nullable
              as String?,
      petSize: freezed == petSize
          ? _value.petSize
          : petSize // ignore: cast_nullable_to_non_nullable
              as String?,
      department: freezed == department
          ? _value.department
          : department // ignore: cast_nullable_to_non_nullable
              as String?,
      city: freezed == city
          ? _value.city
          : city // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PublicationsResponseQueryImplCopyWith<$Res>
    implements $PublicationsResponseQueryCopyWith<$Res> {
  factory _$$PublicationsResponseQueryImplCopyWith(
          _$PublicationsResponseQueryImpl value,
          $Res Function(_$PublicationsResponseQueryImpl) then) =
      __$$PublicationsResponseQueryImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? petType,
      String? petSex,
      String? petSize,
      String? department,
      String? city});
}

/// @nodoc
class __$$PublicationsResponseQueryImplCopyWithImpl<$Res>
    extends _$PublicationsResponseQueryCopyWithImpl<$Res,
        _$PublicationsResponseQueryImpl>
    implements _$$PublicationsResponseQueryImplCopyWith<$Res> {
  __$$PublicationsResponseQueryImplCopyWithImpl(
      _$PublicationsResponseQueryImpl _value,
      $Res Function(_$PublicationsResponseQueryImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? petType = freezed,
    Object? petSex = freezed,
    Object? petSize = freezed,
    Object? department = freezed,
    Object? city = freezed,
  }) {
    return _then(_$PublicationsResponseQueryImpl(
      petType: freezed == petType
          ? _value.petType
          : petType // ignore: cast_nullable_to_non_nullable
              as String?,
      petSex: freezed == petSex
          ? _value.petSex
          : petSex // ignore: cast_nullable_to_non_nullable
              as String?,
      petSize: freezed == petSize
          ? _value.petSize
          : petSize // ignore: cast_nullable_to_non_nullable
              as String?,
      department: freezed == department
          ? _value.department
          : department // ignore: cast_nullable_to_non_nullable
              as String?,
      city: freezed == city
          ? _value.city
          : city // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$PublicationsResponseQueryImpl implements _PublicationsResponseQuery {
  _$PublicationsResponseQueryImpl(
      {this.petType, this.petSex, this.petSize, this.department, this.city});

  factory _$PublicationsResponseQueryImpl.fromJson(Map<String, dynamic> json) =>
      _$$PublicationsResponseQueryImplFromJson(json);

  @override
  final String? petType;
  @override
  final String? petSex;
  @override
  final String? petSize;
  @override
  final String? department;
  @override
  final String? city;

  @override
  String toString() {
    return 'PublicationsResponseQuery(petType: $petType, petSex: $petSex, petSize: $petSize, department: $department, city: $city)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PublicationsResponseQueryImpl &&
            (identical(other.petType, petType) || other.petType == petType) &&
            (identical(other.petSex, petSex) || other.petSex == petSex) &&
            (identical(other.petSize, petSize) || other.petSize == petSize) &&
            (identical(other.department, department) ||
                other.department == department) &&
            (identical(other.city, city) || other.city == city));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, petType, petSex, petSize, department, city);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$PublicationsResponseQueryImplCopyWith<_$PublicationsResponseQueryImpl>
      get copyWith => __$$PublicationsResponseQueryImplCopyWithImpl<
          _$PublicationsResponseQueryImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PublicationsResponseQueryImplToJson(
      this,
    );
  }
}

abstract class _PublicationsResponseQuery implements PublicationsResponseQuery {
  factory _PublicationsResponseQuery(
      {final String? petType,
      final String? petSex,
      final String? petSize,
      final String? department,
      final String? city}) = _$PublicationsResponseQueryImpl;

  factory _PublicationsResponseQuery.fromJson(Map<String, dynamic> json) =
      _$PublicationsResponseQueryImpl.fromJson;

  @override
  String? get petType;
  @override
  String? get petSex;
  @override
  String? get petSize;
  @override
  String? get department;
  @override
  String? get city;
  @override
  @JsonKey(ignore: true)
  _$$PublicationsResponseQueryImplCopyWith<_$PublicationsResponseQueryImpl>
      get copyWith => throw _privateConstructorUsedError;
}
