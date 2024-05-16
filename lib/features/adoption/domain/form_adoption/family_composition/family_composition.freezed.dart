// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'family_composition.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

FamilyComposition _$FamilyCompositionFromJson(Map<String, dynamic> json) {
  return _FamilyComposition.fromJson(json);
}

/// @nodoc
mixin _$FamilyComposition {
  int get adultsHome => throw _privateConstructorUsedError;
  int get kidsHome => throw _privateConstructorUsedError;
  int get babiesHome => throw _privateConstructorUsedError;
  String get ages => throw _privateConstructorUsedError;
  String get composition => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $FamilyCompositionCopyWith<FamilyComposition> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FamilyCompositionCopyWith<$Res> {
  factory $FamilyCompositionCopyWith(
          FamilyComposition value, $Res Function(FamilyComposition) then) =
      _$FamilyCompositionCopyWithImpl<$Res, FamilyComposition>;
  @useResult
  $Res call(
      {int adultsHome,
      int kidsHome,
      int babiesHome,
      String ages,
      String composition});
}

/// @nodoc
class _$FamilyCompositionCopyWithImpl<$Res, $Val extends FamilyComposition>
    implements $FamilyCompositionCopyWith<$Res> {
  _$FamilyCompositionCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? adultsHome = null,
    Object? kidsHome = null,
    Object? babiesHome = null,
    Object? ages = null,
    Object? composition = null,
  }) {
    return _then(_value.copyWith(
      adultsHome: null == adultsHome
          ? _value.adultsHome
          : adultsHome // ignore: cast_nullable_to_non_nullable
              as int,
      kidsHome: null == kidsHome
          ? _value.kidsHome
          : kidsHome // ignore: cast_nullable_to_non_nullable
              as int,
      babiesHome: null == babiesHome
          ? _value.babiesHome
          : babiesHome // ignore: cast_nullable_to_non_nullable
              as int,
      ages: null == ages
          ? _value.ages
          : ages // ignore: cast_nullable_to_non_nullable
              as String,
      composition: null == composition
          ? _value.composition
          : composition // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$FamilyCompositionImplCopyWith<$Res>
    implements $FamilyCompositionCopyWith<$Res> {
  factory _$$FamilyCompositionImplCopyWith(_$FamilyCompositionImpl value,
          $Res Function(_$FamilyCompositionImpl) then) =
      __$$FamilyCompositionImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int adultsHome,
      int kidsHome,
      int babiesHome,
      String ages,
      String composition});
}

/// @nodoc
class __$$FamilyCompositionImplCopyWithImpl<$Res>
    extends _$FamilyCompositionCopyWithImpl<$Res, _$FamilyCompositionImpl>
    implements _$$FamilyCompositionImplCopyWith<$Res> {
  __$$FamilyCompositionImplCopyWithImpl(_$FamilyCompositionImpl _value,
      $Res Function(_$FamilyCompositionImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? adultsHome = null,
    Object? kidsHome = null,
    Object? babiesHome = null,
    Object? ages = null,
    Object? composition = null,
  }) {
    return _then(_$FamilyCompositionImpl(
      adultsHome: null == adultsHome
          ? _value.adultsHome
          : adultsHome // ignore: cast_nullable_to_non_nullable
              as int,
      kidsHome: null == kidsHome
          ? _value.kidsHome
          : kidsHome // ignore: cast_nullable_to_non_nullable
              as int,
      babiesHome: null == babiesHome
          ? _value.babiesHome
          : babiesHome // ignore: cast_nullable_to_non_nullable
              as int,
      ages: null == ages
          ? _value.ages
          : ages // ignore: cast_nullable_to_non_nullable
              as String,
      composition: null == composition
          ? _value.composition
          : composition // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$FamilyCompositionImpl implements _FamilyComposition {
  _$FamilyCompositionImpl(
      {required this.adultsHome,
      required this.kidsHome,
      required this.babiesHome,
      required this.ages,
      required this.composition});

  factory _$FamilyCompositionImpl.fromJson(Map<String, dynamic> json) =>
      _$$FamilyCompositionImplFromJson(json);

  @override
  final int adultsHome;
  @override
  final int kidsHome;
  @override
  final int babiesHome;
  @override
  final String ages;
  @override
  final String composition;

  @override
  String toString() {
    return 'FamilyComposition(adultsHome: $adultsHome, kidsHome: $kidsHome, babiesHome: $babiesHome, ages: $ages, composition: $composition)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FamilyCompositionImpl &&
            (identical(other.adultsHome, adultsHome) ||
                other.adultsHome == adultsHome) &&
            (identical(other.kidsHome, kidsHome) ||
                other.kidsHome == kidsHome) &&
            (identical(other.babiesHome, babiesHome) ||
                other.babiesHome == babiesHome) &&
            (identical(other.ages, ages) || other.ages == ages) &&
            (identical(other.composition, composition) ||
                other.composition == composition));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, adultsHome, kidsHome, babiesHome, ages, composition);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$FamilyCompositionImplCopyWith<_$FamilyCompositionImpl> get copyWith =>
      __$$FamilyCompositionImplCopyWithImpl<_$FamilyCompositionImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$FamilyCompositionImplToJson(
      this,
    );
  }
}

abstract class _FamilyComposition implements FamilyComposition {
  factory _FamilyComposition(
      {required final int adultsHome,
      required final int kidsHome,
      required final int babiesHome,
      required final String ages,
      required final String composition}) = _$FamilyCompositionImpl;

  factory _FamilyComposition.fromJson(Map<String, dynamic> json) =
      _$FamilyCompositionImpl.fromJson;

  @override
  int get adultsHome;
  @override
  int get kidsHome;
  @override
  int get babiesHome;
  @override
  String get ages;
  @override
  String get composition;
  @override
  @JsonKey(ignore: true)
  _$$FamilyCompositionImplCopyWith<_$FamilyCompositionImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
