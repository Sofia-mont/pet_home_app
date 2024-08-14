import 'package:dio/dio.dart';
import 'package:pet_home/core/constants/app_constants.dart';
import 'package:pet_home/core/utils/dio/dio_provider.dart';
import 'package:pet_home/features/tracking/domain/event.dart';
import 'package:pet_home/features/tracking/domain/event_request.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:riverpod_infinite_scroll_pagination/riverpod_infinite_scroll_pagination.dart';

part 'tracking_repository.g.dart';

@riverpod
TrackingRepository trackingRepository(TrackingRepositoryRef ref) =>
    TrackingRepository(client: ref.watch(dioProvider));

class TrackingRepository {
  TrackingRepository({required this.client});
  final Dio client;

  Future<PaginatedResponse<Event>> getEvents({
    int page = 1,
    String? query = '',
    CancelToken? cancelToken,
  }) async {
    await Future<void>.delayed(const Duration(seconds: 1));
    const path = '${AppConstants.baseURL}/tracking';
    final response = await client.get(
      path,
      queryParameters: {'page': page},
      cancelToken: cancelToken,
    );
    return PaginatedResponse.fromJson(
      response.data,
      dataMapper: Event.fromJson,
      paginationParser: (data) => Pagination(
        totalNumber: data['totalResults'] as int,
        currentPage: data['actualPage'] as int,
        lastPage: data['totalPages'] as int,
      ),
    );
  }

  Future<void> postEvent({required EventRequest event}) async {
    const path = '${AppConstants.baseURL}/tracking';
    final data = event.toJson();
    await client.post(
      path,
      data: data,
    );
  }

  Future<void> editEvent({
    required EventRequest event,
    required String eventId,
  }) async {
    final path = '${AppConstants.baseURL}/tracking/$eventId';
    await client.put(path, data: event.toJson());
  }

  Future<void> deleteEvent({
    required String eventId,
  }) async {
    final path = '${AppConstants.baseURL}/tracking/$eventId';
    await client.delete(path);
  }
}
