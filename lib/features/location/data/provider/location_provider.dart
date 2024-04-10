import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pet_home/core/extension_methods/future_extension.dart';
import 'package:pet_home/core/sealed/either.dart';
import 'package:pet_home/features/location/data/provider/location_state.dart';
import 'package:pet_home/features/location/data/repository/location_repository.dart';

final locationProvider = StateNotifierProvider<LocationNotifier, LocationState>(
  LocationNotifier.fromRef,
);

class LocationNotifier extends StateNotifier<LocationState> {
  LocationNotifier({
    required this.ref,
    required this.locationRepository,
  }) : super(LocationState.initial());

  factory LocationNotifier.fromRef(Ref ref) {
    return LocationNotifier(
      ref: ref,
      locationRepository: ref.read(locationRepositoryProvider),
    );
  }

  final LocationRepository locationRepository;
  final Ref ref;

  void resetState() => state = LocationState.initial();

  Future<List<String>> getDepartamentos() async {
    final res = await locationRepository.fetchDepartamentos().toEither();
    return res.fold(
      (left) => [],
      (right) => right,
    );
  }

  Future<List<String>> getCiudades(String departamento) async {
    final res = await locationRepository.fetchCiudades(departamento).toEither();
    return res.fold(
      (left) => [],
      (right) => right,
    );
  }
}
