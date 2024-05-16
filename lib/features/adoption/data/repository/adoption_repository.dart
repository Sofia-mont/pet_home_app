import 'package:dio/dio.dart';
import 'package:pet_home/core/constants/app_constants.dart';
import 'package:pet_home/core/utils/dio/dio_provider.dart';
import 'package:pet_home/features/adoption/domain/form_adoption/form_adoption_request/form_adoption_request.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'adoption_repository.g.dart';

@riverpod
AdoptionRepository adoptionRepository(AdoptionRepositoryRef ref) =>
    AdoptionRepository(client: ref.watch(dioProvider));

class AdoptionRepository {
  AdoptionRepository({required this.client});
  final Dio client;

  Future<void> sendFormAdoption({
    required FormAdoptionRequest formAdoptionRequest,
    required int postId,
  }) async {
    final path = '${AppConstants.baseURL}/adoption-application?postId=$postId';
    final data = formAdoptionRequest.toJson();
    await client.post(
      path,
      data: data,
      options: Options(
        headers: {'Content-Type': 'application/json'},
      ),
    );
  }
}
