// ignore_for_file: avoid_manual_providers_as_generated_provider_dependency, unused_result
import 'package:dio/dio.dart';
import 'package:pet_home/core/extension_methods/future_extension.dart';
import 'package:pet_home/core/router/router.dart';
import 'package:pet_home/features/tracking/data/repository/tracking_repository.dart';
import 'package:pet_home/features/tracking/domain/event.dart';
import 'package:pet_home/features/tracking/domain/event_request.dart';
import 'package:pet_home/ui/widgets/modals/custom_modals.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:riverpod_infinite_scroll_pagination/riverpod_infinite_scroll_pagination.dart';

part 'tracking_provider.g.dart';

@riverpod
class FetchEvents extends _$FetchEvents
    with PaginatedDataMixinGeneric<Event>
    implements PaginatedNotifier<Event> {
  @override
  FutureOr<List<Event>> build() async {
    state = const AsyncValue.loading();
    final cancelToken = CancelToken();
    return await init(
      dataFetcher: PaginatedDataRepository(
        fetcher: ({int page = 1, String? query}) async {
          return ref.watch(trackingRepositoryProvider).getEvents(
                page: page,
                query: query,
                cancelToken: cancelToken,
              );
        },
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
class EventsNotifier extends _$EventsNotifier {
  @override
  void build() {}

  Future<void> postEvent({required EventRequest request}) async {
    ref.read(customModalsProvider).showLoadingDialog();
    final res = await ref
        .read(trackingRepositoryProvider)
        .postEvent(event: request)
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
      ref.read(appRouterProvider).pop();
      ref.refresh(fetchEventsProvider);
    }
  }

  Future<void> deleteEvent({required int eventId}) async {
    ref.read(customModalsProvider).showLoadingDialog();
    final res = await ref
        .read(trackingRepositoryProvider)
        .deleteEvent(eventId: eventId.toString())
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
      ref.refresh(fetchEventsProvider);
    }
  }

  Future<void> editPet({
    required EventRequest request,
    required String eventId,
  }) async {
    ref.read(customModalsProvider).showLoadingDialog();
    final res = await ref
        .read(trackingRepositoryProvider)
        .editEvent(event: request, eventId: eventId)
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
      ref.refresh(fetchEventsProvider);
    }
  }
}
