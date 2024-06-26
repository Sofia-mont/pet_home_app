import 'package:dio/dio.dart';
import 'package:pet_home/core/constants/app_constants.dart';
import 'package:pet_home/core/utils/dio/dio_provider.dart';
import 'package:pet_home/features/posts/domain/post.dart';
import 'package:pet_home/features/posts/domain/post_request.dart';
import 'package:pet_home/features/posts/domain/posts_search_query.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:riverpod_infinite_scroll_pagination/riverpod_infinite_scroll_pagination.dart';

part 'publications_repository.g.dart';

@riverpod
PublicationsRepository publicationsRepository(PublicationsRepositoryRef ref) =>
    PublicationsRepository(client: ref.watch(dioProvider));

class PublicationsRepository {
  PublicationsRepository({required this.client});
  final Dio client;

  Future<PaginatedResponse<Post>> getFilteredPosts({
    int page = 1,
    String? query = '',
    PostsResponseQuery? filters,
    CancelToken? cancelToken,
  }) async {
    const path = '${AppConstants.baseURL}/post/search';
    final generatedQuery = _generateQuery(filters, page);
    final response = await client.get(
      path,
      queryParameters: generatedQuery,
      cancelToken: cancelToken,
    );
    return PaginatedResponse.fromJson(
      response.data,
      dataMapper: Post.fromJson,
      paginationParser: (data) => Pagination(
        totalNumber: data['totalResults'] as int,
        currentPage: data['actualPage'] as int,
        lastPage: data['totalPages'] as int,
      ),
    );
  }

  Future<PaginatedResponse<Post>> getPostsByUserAndState({
    int page = 1,
    String? query = '',
    required String status,
    CancelToken? cancelToken,
  }) async {
    await Future<void>.delayed(const Duration(seconds: 1));
    const path = '${AppConstants.baseURL}/post/user';
    final response = await client.get(
      path,
      queryParameters: {'page': page, 'state': status},
      cancelToken: cancelToken,
    );
    return PaginatedResponse.fromJson(
      response.data,
      dataMapper: Post.fromJson,
      paginationParser: (data) => Pagination(
        totalNumber: data['totalResults'] as int,
        currentPage: data['actualPage'] as int,
        lastPage: data['totalPages'] as int,
      ),
    );
  }

  Future<PaginatedResponse<Post>> getPostByPostulation({
    int page = 1,
    String? query = '',
  }) async {
    const path = '${AppConstants.baseURL}/adoption-application/my-postulations';
    final response = await client.get(
      path,
      queryParameters: {'page': page},
    );
    return PaginatedResponse.fromJson(
      response.data!,
      dataMapper: Post.fromJson,
      paginationParser: (data) => Pagination(
        totalNumber: data['totalResults'] as int,
        currentPage: data['actualPage'] as int,
        lastPage: data['totalPages'] as int,
      ),
    );
  }

  Future<void> postPet({required PostRequest post}) async {
    const path = '${AppConstants.baseURL}/post';
    var formData = FormData();
    for (var image in post.images!) {
      final imageBytes = await image.readAsBytes();
      formData.files.add(
        MapEntry(
          'images',
          MultipartFile.fromBytes(
            imageBytes,
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
      }.entries.map((e) => MapEntry(e.key, e.value!)),
    );
    await client.post(path, data: formData);
  }

  Future<void> editPet({
    required PostRequest post,
    required String postId,
  }) async {
    final path = '${AppConstants.baseURL}/post/$postId';
    var formData = FormData();
    if (post.images == null || post.images!.isEmpty) {
      formData.files.add(
        MapEntry(
          'petImages',
          MultipartFile.fromString('', filename: 'empty_image.jpg'),
        ),
      );
    } else {
      for (var image in post.images!) {
        final imageBytes = await image.readAsBytes();
        formData.files.add(
          MapEntry(
            'petImages',
            MultipartFile.fromBytes(
              imageBytes,
              filename: image.path,
            ),
          ),
        );
      }
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
      }.entries.map((e) => MapEntry(e.key, e.value!)),
    );
    await client.put(path, data: formData);
  }

  Future<void> deletePost({
    required String postId,
  }) async {
    final path = '${AppConstants.baseURL}/post/$postId';
    await client.delete(path);
  }
}

Map<String, dynamic> _generateQuery(
  PostsResponseQuery? query,
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
