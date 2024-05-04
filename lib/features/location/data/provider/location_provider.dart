import 'package:pet_home/core/extension_methods/future_extension.dart';
import 'package:pet_home/core/sealed/either.dart';
import 'package:pet_home/features/location/data/provider/location_state.dart';
import 'package:pet_home/features/location/data/repository/location_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'location_provider.g.dart';

@riverpod
class LocationNotifier extends _$LocationNotifier {
  @override
  LocationState build() => LocationState.initial();

  void resetState() => state = LocationState.initial();

  Future<List<String>> getDepartamentos() async {
    final res = await ref
        .read(locationRepositoryProvider)
        .fetchDepartamentos()
        .toEither();
    return res.fold(
      (left) => [],
      (right) => right,
    );
  }

  Future<List<String>> getCiudades(String departamento) async {
    final res = await ref
        .read(locationRepositoryProvider)
        .fetchCiudades(departamento)
        .toEither();
    return res.fold(
      (left) => [],
      (right) => right,
    );
  }
}
