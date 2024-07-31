import 'package:dio/dio.dart';
import 'package:pet_home/core/utils/dio/dio_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'location_repository.g.dart';

@riverpod
LocationRepository locationRepository(LocationRepositoryRef ref) =>
    LocationRepository(client: ref.watch(dioProvider));

class LocationRepository {
  LocationRepository({required this.client});

  final Dio client;

  Future<List<String>> fetchDepartamentos() async {
    const path =
        'https://www.datos.gov.co/resource/xdk5-pm3f.json?\$select=departamento&\$group=departamento';
    final response = await client.get(
      path,
      options: Options(
        headers: {'requiresToken': false},
      ),
    );
    if (response.statusCode == 200) {
      final List<dynamic> data = response.data;
      final List<String> departamentos =
          data.map((item) => item['departamento'] as String).toList();
      return departamentos;
    }
    return [];
  }

  Future<List<String>> fetchCiudades(String departamento) async {
    final path =
        'https://www.datos.gov.co/resource/xdk5-pm3f.json?\$select=municipio&\$limit=1123&departamento=$departamento';
    final response = await client.get(
      path,
      options: Options(
        headers: {'requiresToken': false},
      ),
    );
    if (response.statusCode == 200) {
      final List<dynamic> data = response.data;
      final List<String> cities =
          data.map((item) => item['municipio'] as String).toList();
      return cities;
    }
    return [];
  }
}
