// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'municipio.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

Municipio _$MunicipioFromJson(Map<String, dynamic> json) {
  return _Municipio.fromJson(json);
}

/// @nodoc
mixin _$Municipio {
  @JsonKey(name: 'municipio')
  String get municipio => throw _privateConstructorUsedError;
  @JsonKey(name: 'c_digo_dane_del_municipio')
  String get codigoMunicipio => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $MunicipioCopyWith<Municipio> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MunicipioCopyWith<$Res> {
  factory $MunicipioCopyWith(Municipio value, $Res Function(Municipio) then) =
      _$MunicipioCopyWithImpl<$Res, Municipio>;
  @useResult
  $Res call(
      {@JsonKey(name: 'municipio') String municipio,
      @JsonKey(name: 'c_digo_dane_del_municipio') String codigoMunicipio});
}

/// @nodoc
class _$MunicipioCopyWithImpl<$Res, $Val extends Municipio>
    implements $MunicipioCopyWith<$Res> {
  _$MunicipioCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? municipio = null,
    Object? codigoMunicipio = null,
  }) {
    return _then(_value.copyWith(
      municipio: null == municipio
          ? _value.municipio
          : municipio // ignore: cast_nullable_to_non_nullable
              as String,
      codigoMunicipio: null == codigoMunicipio
          ? _value.codigoMunicipio
          : codigoMunicipio // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$MunicipioImplCopyWith<$Res>
    implements $MunicipioCopyWith<$Res> {
  factory _$$MunicipioImplCopyWith(
          _$MunicipioImpl value, $Res Function(_$MunicipioImpl) then) =
      __$$MunicipioImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'municipio') String municipio,
      @JsonKey(name: 'c_digo_dane_del_municipio') String codigoMunicipio});
}

/// @nodoc
class __$$MunicipioImplCopyWithImpl<$Res>
    extends _$MunicipioCopyWithImpl<$Res, _$MunicipioImpl>
    implements _$$MunicipioImplCopyWith<$Res> {
  __$$MunicipioImplCopyWithImpl(
      _$MunicipioImpl _value, $Res Function(_$MunicipioImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? municipio = null,
    Object? codigoMunicipio = null,
  }) {
    return _then(_$MunicipioImpl(
      null == municipio
          ? _value.municipio
          : municipio // ignore: cast_nullable_to_non_nullable
              as String,
      null == codigoMunicipio
          ? _value.codigoMunicipio
          : codigoMunicipio // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$MunicipioImpl implements _Municipio {
  _$MunicipioImpl(@JsonKey(name: 'municipio') this.municipio,
      @JsonKey(name: 'c_digo_dane_del_municipio') this.codigoMunicipio);

  factory _$MunicipioImpl.fromJson(Map<String, dynamic> json) =>
      _$$MunicipioImplFromJson(json);

  @override
  @JsonKey(name: 'municipio')
  final String municipio;
  @override
  @JsonKey(name: 'c_digo_dane_del_municipio')
  final String codigoMunicipio;

  @override
  String toString() {
    return 'Municipio(municipio: $municipio, codigoMunicipio: $codigoMunicipio)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MunicipioImpl &&
            (identical(other.municipio, municipio) ||
                other.municipio == municipio) &&
            (identical(other.codigoMunicipio, codigoMunicipio) ||
                other.codigoMunicipio == codigoMunicipio));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, municipio, codigoMunicipio);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$MunicipioImplCopyWith<_$MunicipioImpl> get copyWith =>
      __$$MunicipioImplCopyWithImpl<_$MunicipioImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$MunicipioImplToJson(
      this,
    );
  }
}

abstract class _Municipio implements Municipio {
  factory _Municipio(
      @JsonKey(name: 'municipio') final String municipio,
      @JsonKey(name: 'c_digo_dane_del_municipio')
      final String codigoMunicipio) = _$MunicipioImpl;

  factory _Municipio.fromJson(Map<String, dynamic> json) =
      _$MunicipioImpl.fromJson;

  @override
  @JsonKey(name: 'municipio')
  String get municipio;
  @override
  @JsonKey(name: 'c_digo_dane_del_municipio')
  String get codigoMunicipio;
  @override
  @JsonKey(ignore: true)
  _$$MunicipioImplCopyWith<_$MunicipioImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
