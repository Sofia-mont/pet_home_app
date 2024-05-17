import 'package:dio/dio.dart';
import 'package:pet_home/core/constants/app_constants.dart';
import 'package:pet_home/core/utils/dio/dio_provider.dart';
import 'package:pet_home/features/adoption/domain/form_adoption_projection/form_adoption_projection.dart';
import 'package:pet_home/features/adoption/domain/form_adoption_request/form_adoption_request.dart';
import 'package:pet_home/features/adoption/domain/postulation_search_query/postulation_search_query.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:riverpod_infinite_scroll_pagination/riverpod_infinite_scroll_pagination.dart';

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

  Future<PaginatedResponse<FormAdoptionProjection>> getAdoptionForms({
    int page = 1,
    String? query = '',
    CancelToken? cancelToken,
    PostulationSearchQuery? filters,
  }) async {
    var path =
        '${AppConstants.baseURL}/adoption-application/post/${filters!.postId}';
    final response = await client.get(
      path,
      queryParameters: {'page': page, 'state': filters.status},
      cancelToken: cancelToken,
    );
    return PaginatedResponse.fromJson(
      response.data,
      dataMapper: FormAdoptionProjection.fromJson,
      paginationParser: (data) => Pagination(
        totalNumber: data['totalResults'] as int,
        currentPage: data['actualPage'] as int,
        lastPage: data['totalPages'] as int,
      ),
    );
  }
}
