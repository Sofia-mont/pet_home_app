// ignore_for_file: avoid_manual_providers_as_generated_provider_dependency
import 'dart:async';

import 'package:dio/dio.dart';
import 'package:pet_home/core/extension_methods/future_extension.dart';
import 'package:pet_home/core/router/router.dart';
import 'package:pet_home/features/home/presentation/home_screen.dart';
import 'package:pet_home/features/posts/data/repository/publications_repository.dart';
import 'package:pet_home/features/posts/domain/post.dart';
import 'package:pet_home/features/posts/domain/post_request.dart';
import 'package:pet_home/features/posts/domain/posts_search_query.dart';
import 'package:pet_home/ui/widgets/modals/custom_modals.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:riverpod_infinite_scroll_pagination/riverpod_infinite_scroll_pagination.dart';

part 'publications_provider.g.dart';

@riverpod
class FetchFilteredPosts extends _$FetchFilteredPosts
    with PaginatedDataMixinGeneric<Post>
    implements PaginatedNotifier<Post> {
  @override
  FutureOr<List<Post>> build(PostsResponseQuery? filters) async {
    state = const AsyncValue.loading();
    final cancelToken = CancelToken();
    return await init(
      dataFetcher: PaginatedDataRepository(
        fetcher: ({int page = 1, String? query}) async {
          return ref.watch(publicationsRepositoryProvider).getFilteredPosts(
                filters: filters,
                page: page,
                query: query,
                cancelToken: cancelToken,
              );
        },
        queryFilter: filters.toString(),
      ),
    );
  }

  @override
  Future<void> getNextPage() async {
    state = const AsyncLoading();
    state = AsyncData(await fetchData());
  }

  @override
  Future<void> refresh() async {
    state = const AsyncLoading();
  }
}

@riverpod
class MyPostList extends _$MyPostList
    with PaginatedDataMixinGeneric<Post>
    implements PaginatedNotifier<Post> {
  @override
  FutureOr<List<Post>> build(String status) async {
    state = const AsyncValue.loading();
    final cancelToken = CancelToken();
    return await init(
      dataFetcher: PaginatedDataRepository(
        fetcher: ({int page = 1, String? query}) async {
          return ref
              .watch(publicationsRepositoryProvider)
              .getPostsByUserAndState(
                status: status,
                page: page,
                query: query,
                cancelToken: cancelToken,
              );
        },
        queryFilter: status,
      ),
    );
  }

  @override
  Future<void> getNextPage() async {
    state = const AsyncLoading();
    state = AsyncData(await fetchData());
  }

  @override
  Future<void> refresh() async {
    state = const AsyncLoading();
  }
}

@riverpod
class MyPostulations extends _$MyPostulations
    with PaginatedDataMixin<Post>
    implements PaginatedNotifier<Post> {
  @override
  FutureOr<List<Post>> build() async {
    return init(
      dataFetcher: PaginatedDataRepository(
        fetcher: ref.watch(publicationsRepositoryProvider).getPostByPostulation,
      ),
    );
  }
}

@riverpod
class PublicationsNotifier extends _$PublicationsNotifier {
  @override
  void build() {}

  Future<void> postPet({required PostRequest request}) async {
    ref.read(customModalsProvider).showLoadingDialog();
    final res = await ref
        .read(publicationsRepositoryProvider)
        .postPet(post: request)
        .toFailure();
    ref.read(customModalsProvider).pop();
    if (res != null) {
      ref.read(customModalsProvider).showInfoDialog(
            title: 'Error',
            content: res.message,
            buttonText: 'Reintentar',
          );
      return;
    } else {
      ref.read(customModalsProvider).showInformativeScreen(
            isError: false,
            title: '¡Hemos publicado tu mascota!',
            message:
                'En cualquier momento podrían llegarte solicitudes de adopción, asegurate de revisar sus formularios con toda la información para determinar si es un candidato apto.',
            buttonMsg: 'Continuar',
            onPressed: () =>
                ref.read(appRouterProvider).goNamed(HomeScreen.path),
          );
    }
  }

  Future<void> deletePost({required int postId}) async {
    ref.read(customModalsProvider).showLoadingDialog();
    final res = await ref
        .read(publicationsRepositoryProvider)
        .deletePost(postId: postId.toString())
        .toFailure();
    ref.read(customModalsProvider).pop();
    if (res != null) {
      ref.read(customModalsProvider).showInfoDialog(
            title: 'Error',
            content: res.message,
            buttonText: 'Reintentar',
          );
      return;
    } else {
      ref.read(customModalsProvider).showInfoDialog(
            title: 'Eliminado',
            content: 'La publicación ha sido eliminada exitosamente',
            buttonText: 'Continuar',
            buttonAction: () {
              ref.read(appRouterProvider).pop();
              ref.read(appRouterProvider).goNamed(HomeScreen.path);
            },
          );
    }
  }

  Future<void> editPet({
    required PostRequest request,
    required String postId,
  }) async {
    ref.read(customModalsProvider).showLoadingDialog();
    final res = await ref
        .read(publicationsRepositoryProvider)
        .editPet(post: request, postId: postId)
        .toFailure();
    ref.read(customModalsProvider).pop();
    if (res != null) {
      ref.read(customModalsProvider).showInfoDialog(
            title: 'Error',
            content: res.message,
            buttonText: 'Reintentar',
          );
      return;
    } else {
      ref.read(customModalsProvider).showInfoDialog(
            title: '',
            content: 'La publicación ha sido modificada exitosamente',
            buttonText: 'Continuar',
            buttonAction: () {
              ref.read(appRouterProvider).pop();
              ref.read(appRouterProvider).goNamed(HomeScreen.path);
            },
          );
    }
  }
}
