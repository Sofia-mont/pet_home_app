import 'package:dio/dio.dart';
import 'package:pet_home/core/utils/dio/dio_provider.dart';
import 'package:pet_home/core/constants/app_constants.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'location_repository.g.dart';

@riverpod
LocationRepository locationRepository(LocationRepositoryRef ref) =>
    LocationRepository(client: ref.watch(dioProvider));

class LocationRepository {
  LocationRepository({required this.client});

  final Dio client;

  Future<List<String>> fetchDepartamentos() async {
    const path = '${AppConstants.baseURL}/location/departments';
    final response = await client.get(
      path,
      options: Options(
        headers: {'requiresToken': false},
      ),
    );
    if (response.statusCode == 200) {
      List<String> data = List<String>.from(response.data);
      return data;
    }
    return [];
  }

  Future<List<String>> fetchCiudades(String departamento) async {
    final path =
        '${AppConstants.baseURL}/location/cities?department=$departamento';
    final response = await client.get(
      path,
      options: Options(
        headers: {'requiresToken': false},
      ),
    );
    if (response.statusCode == 200) {
      List<String> data = List<String>.from(response.data);
      return data;
    }
    return [];
  }
}
