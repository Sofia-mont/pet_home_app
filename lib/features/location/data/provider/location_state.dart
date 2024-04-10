import 'package:equatable/equatable.dart';
import 'package:pet_home/core/sealed/custom_async_value.dart';

class LocationState extends Equatable {
  const LocationState({required this.departamentos, required this.ciudades});

  factory LocationState.initial() => const LocationState(
        departamentos: AppAsync.loading(),
        ciudades: AppAsync.loading(),
      );

  final AppAsync<List<String>> departamentos;
  final AppAsync<List<String>> ciudades;

  @override
  List<Object?> get props => [departamentos, ciudades];

  LocationState copyWith({
    AppAsync<List<String>>? departamentos,
    AppAsync<List<String>>? ciudades,
  }) =>
      LocationState(
        departamentos: departamentos ?? this.departamentos,
        ciudades: ciudades ?? this.ciudades,
      );
}
