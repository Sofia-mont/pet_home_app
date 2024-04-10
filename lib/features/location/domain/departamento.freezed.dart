// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'departamento.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

Departamento _$DepartamentoFromJson(Map<String, dynamic> json) {
  return _Departamento.fromJson(json);
}

/// @nodoc
mixin _$Departamento {
  @JsonKey(name: 'departamento')
  String get departamento => throw _privateConstructorUsedError;
  @JsonKey(name: 'c_digo_dane_del_departamento')
  String get codigoDepartamento => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $DepartamentoCopyWith<Departamento> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DepartamentoCopyWith<$Res> {
  factory $DepartamentoCopyWith(
          Departamento value, $Res Function(Departamento) then) =
      _$DepartamentoCopyWithImpl<$Res, Departamento>;
  @useResult
  $Res call(
      {@JsonKey(name: 'departamento') String departamento,
      @JsonKey(name: 'c_digo_dane_del_departamento')
      String codigoDepartamento});
}

/// @nodoc
class _$DepartamentoCopyWithImpl<$Res, $Val extends Departamento>
    implements $DepartamentoCopyWith<$Res> {
  _$DepartamentoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? departamento = null,
    Object? codigoDepartamento = null,
  }) {
    return _then(_value.copyWith(
      departamento: null == departamento
          ? _value.departamento
          : departamento // ignore: cast_nullable_to_non_nullable
              as String,
      codigoDepartamento: null == codigoDepartamento
          ? _value.codigoDepartamento
          : codigoDepartamento // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$DepartamentoImplCopyWith<$Res>
    implements $DepartamentoCopyWith<$Res> {
  factory _$$DepartamentoImplCopyWith(
          _$DepartamentoImpl value, $Res Function(_$DepartamentoImpl) then) =
      __$$DepartamentoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'departamento') String departamento,
      @JsonKey(name: 'c_digo_dane_del_departamento')
      String codigoDepartamento});
}

/// @nodoc
class __$$DepartamentoImplCopyWithImpl<$Res>
    extends _$DepartamentoCopyWithImpl<$Res, _$DepartamentoImpl>
    implements _$$DepartamentoImplCopyWith<$Res> {
  __$$DepartamentoImplCopyWithImpl(
      _$DepartamentoImpl _value, $Res Function(_$DepartamentoImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? departamento = null,
    Object? codigoDepartamento = null,
  }) {
    return _then(_$DepartamentoImpl(
      null == departamento
          ? _value.departamento
          : departamento // ignore: cast_nullable_to_non_nullable
              as String,
      null == codigoDepartamento
          ? _value.codigoDepartamento
          : codigoDepartamento // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$DepartamentoImpl implements _Departamento {
  _$DepartamentoImpl(@JsonKey(name: 'departamento') this.departamento,
      @JsonKey(name: 'c_digo_dane_del_departamento') this.codigoDepartamento);

  factory _$DepartamentoImpl.fromJson(Map<String, dynamic> json) =>
      _$$DepartamentoImplFromJson(json);

  @override
  @JsonKey(name: 'departamento')
  final String departamento;
  @override
  @JsonKey(name: 'c_digo_dane_del_departamento')
  final String codigoDepartamento;

  @override
  String toString() {
    return 'Departamento(departamento: $departamento, codigoDepartamento: $codigoDepartamento)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DepartamentoImpl &&
            (identical(other.departamento, departamento) ||
                other.departamento == departamento) &&
            (identical(other.codigoDepartamento, codigoDepartamento) ||
                other.codigoDepartamento == codigoDepartamento));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, departamento, codigoDepartamento);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$DepartamentoImplCopyWith<_$DepartamentoImpl> get copyWith =>
      __$$DepartamentoImplCopyWithImpl<_$DepartamentoImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$DepartamentoImplToJson(
      this,
    );
  }
}

abstract class _Departamento implements Departamento {
  factory _Departamento(
      @JsonKey(name: 'departamento') final String departamento,
      @JsonKey(name: 'c_digo_dane_del_departamento')
      final String codigoDepartamento) = _$DepartamentoImpl;

  factory _Departamento.fromJson(Map<String, dynamic> json) =
      _$DepartamentoImpl.fromJson;

  @override
  @JsonKey(name: 'departamento')
  String get departamento;
  @override
  @JsonKey(name: 'c_digo_dane_del_departamento')
  String get codigoDepartamento;
  @override
  @JsonKey(ignore: true)
  _$$DepartamentoImplCopyWith<_$DepartamentoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
