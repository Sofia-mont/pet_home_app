// ignore_for_file: avoid_build_context_in_providers, avoid_manual_providers_as_generated_provider_dependency
import 'dart:async';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:pet_home/core/extension_methods/future_extension.dart';
import 'package:pet_home/core/router/router.dart';
import 'package:pet_home/core/sealed/either.dart';
import 'package:pet_home/features/home/presentation/home_screen.dart';
import 'package:pet_home/features/publications/data/repository/publications_repository.dart';
import 'package:pet_home/features/publications/domain/post/post_request.dart/post_request.dart';
import 'package:pet_home/features/publications/domain/posts/publications_response/publications_response.dart';
import 'package:pet_home/features/publications/domain/posts/publications_search_query/publications_search_query.dart';
import 'package:pet_home/ui/widgets/modals/custom_modals.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'publications_provider.g.dart';

@riverpod
Future<PublicationsResponse> fetchPublications(
  FetchPublicationsRef ref, {
  required int page,
  PublicationsResponseQuery? query,
}) async {
  final res = ref.watch(publicationsRepositoryProvider);

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
  return res.getAllPost(page: page, query: query, cancelToken: cancelToken);
}

@riverpod
Future<void> postPet(
  PostPetRef ref, {
  required BuildContext context,
  required PostRequest request,
}) async {
  final res = await ref
      .read(publicationsRepositoryProvider)
      .postPet(post: request)
      .toEither();
  res.fold(
    (left) => ref
        .read(customModalsProvider)
        .showInformativeScreen(context: context, message: left.message),
    (right) => ref.read(customModalsProvider).showInformativeScreen(
          context: context,
          isError: false,
          message: '¡Hemos publicado tu mascota!',
          title:
              'En cualquier momento podrían llegarte solicitudes de adopción, asegurate de revisar sus formularios con toda la información para determinar si es un candidato apto.',
          buttonMsg: 'Continuar',
          onPressed: () => ref.read(appRouterProvider).goNamed(HomeScreen.path),
        ),
  );
}
