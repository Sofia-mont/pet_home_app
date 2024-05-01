import 'dart:async';

import 'package:dio/dio.dart';
import 'package:pet_home/features/publications/data/repository/publications_repository.dart';
import 'package:pet_home/features/publications/domain/posts/publications_response/publications_response.dart';
import 'package:pet_home/features/publications/domain/posts/publications_search_query/publications_search_query.dart';
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
