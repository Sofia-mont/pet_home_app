import 'package:dio/dio.dart';
import 'package:pet_home/core/constants/app_constants.dart';
import 'package:pet_home/core/utils/dio/dio_provider.dart';
import 'package:pet_home/features/publications/domain/posts/publications_response/publications_response.dart';
import 'package:pet_home/features/publications/domain/posts/publications_search_query/publications_search_query.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'publications_repository.g.dart';

@riverpod
PublicationsRepository publicationsRepository(PublicationsRepositoryRef ref) =>
    PublicationsRepository(client: ref.watch(dioProvider));

class PublicationsRepository {
  PublicationsRepository({required this.client});
  final Dio client;

  Future<PublicationsResponse> getAllPost({
    required int page,
    PublicationsResponseQuery? query,
    CancelToken? cancelToken,
  }) async {
    const path = '${AppConstants.baseURL}/post/search';
    final generatedQuery = _generateQuery(query, page);
    final response = await client.get(
      path,
      queryParameters: generatedQuery,
    );
    return PublicationsResponse.fromJson(response.data);
  }
}

Map<String, dynamic> _generateQuery(
  PublicationsResponseQuery? query,
  int page,
) {
  return {
    'page': page,
    if (query?.petType != null) 'petType': query!.petType,
    if (query?.petSex != null) 'petSex': query!.petSex,
    if (query?.petSize != null) 'petSize': query!.petSize,
    if (query?.department != null) 'department': query!.department,
    if (query?.city != null) 'city': query!.city,
  };
}
