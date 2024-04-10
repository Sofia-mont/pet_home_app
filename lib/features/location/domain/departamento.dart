import 'package:freezed_annotation/freezed_annotation.dart';

part 'departamento.freezed.dart';
part 'departamento.g.dart';

@freezed
abstract class Departamento with _$Departamento {
  factory Departamento(
    @JsonKey(name: 'departamento') String departamento,
    @JsonKey(name: 'c_digo_dane_del_departamento') String codigoDepartamento,
  ) = _Departamento;

  factory Departamento.fromJson(Map<String, dynamic> json) =>
      _$DepartamentoFromJson(json);
}
