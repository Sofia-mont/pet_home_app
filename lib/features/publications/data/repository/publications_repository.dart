import 'package:dio/dio.dart';
import 'package:pet_home/core/constants/app_constants.dart';
import 'package:pet_home/core/utils/dio/dio_provider.dart';
import 'package:pet_home/features/publications/domain/post/post_request.dart/post_request.dart';
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

  Future<void> postPet({required PostRequest post}) async {
    const path = '${AppConstants.baseURL}/post';
    var formData = FormData();
    for (var image in post.images) {
      formData.files.add(
        MapEntry(
          'images',
          MultipartFile.fromBytes(
            await image.readAsBytes(),
            filename: image.path,
          ),
        ),
      );
    }

    formData.fields.addAll(
      {
        'petName': post.petName,
        'petHistory': post.petHistory,
        'petAge': post.petAge,
        'department': post.department,
        'city': post.city,
        'petType': post.petType,
        'petSex': post.petSex,
        'petSize': post.petSize,
        'vaccinated': post.vaccinated.toString(),
        'dewormed': post.dewormed.toString(),
        'neutered': post.neutered.toString(),
      }.entries.map((e) => MapEntry(e.key, e.value)),
    );
    await client.post(path, data: formData);
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
