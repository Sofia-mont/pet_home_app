// ignore_for_file: avoid_build_context_in_providers, avoid_manual_providers_as_generated_provider_dependency, use_build_context_synchronously
import 'dart:async';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:pet_home/core/extension_methods/future_extension.dart';
import 'package:pet_home/core/router/router.dart';
import 'package:pet_home/features/home/presentation/home_screen.dart';
import 'package:pet_home/features/posts/data/repository/publications_repository.dart';
import 'package:pet_home/features/posts/domain/post/post/post.dart';
import 'package:pet_home/features/posts/domain/post/post_request.dart/post_request.dart';
import 'package:pet_home/features/posts/domain/posts/publications_search_query/publications_search_query.dart';
import 'package:pet_home/ui/widgets/modals/custom_modals.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:riverpod_infinite_scroll_pagination/riverpod_infinite_scroll_pagination.dart';

part 'publications_provider.g.dart';

@riverpod
class FetchFilteredPosts extends _$FetchFilteredPosts
    with PaginatedDataMixinGeneric<Post>
    implements PaginatedNotifier<Post> {
  @override
  FutureOr<List<Post>> build(PublicationsResponseQuery? filters) async {
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
    final link = ref.keepAlive();

    Timer? timer;

    ref.onDispose(() {
      cancelToken.cancel();
      timer?.cancel();
    });

    ref.onCancel(() {
      timer = Timer(const Duration(seconds: 30), () {
        link.close();
      });
    });
    ref.onResume(() {
      timer?.cancel();
    });
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
class PublicationsNotifier extends _$PublicationsNotifier {
  @override
  void build() {}

  Future<void> postPet({
    required BuildContext context,
    required PostRequest request,
  }) async {
    final res = await ref
        .read(publicationsRepositoryProvider)
        .postPet(post: request)
        .toFailure();
    if (res != null) {
      ref.read(customModalsProvider).showInfoDialog(
            buildContext: context,
            title: 'Error',
            content: res.message,
            buttonText: 'Reintentar',
          );
      return;
    } else {
      ref.read(customModalsProvider).showInformativeScreen(
            context: context,
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
}
