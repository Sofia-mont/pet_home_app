import 'package:freezed_annotation/freezed_annotation.dart';

part 'municipio.freezed.dart';
part 'municipio.g.dart';

@freezed
abstract class Municipio with _$Municipio {
  factory Municipio(
    @JsonKey(name: 'municipio') String municipio,
    @JsonKey(name: 'c_digo_dane_del_municipio') String codigoMunicipio,
  ) = _Municipio;

  factory Municipio.fromJson(Map<String, dynamic> json) =>
      _$MunicipioFromJson(json);
}
