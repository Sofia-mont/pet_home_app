// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tracking_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$fetchEventsHash() => r'7ba7f17d00b5a1974abc85b3dbd0a4b26538e2cd';

/// See also [FetchEvents].
@ProviderFor(FetchEvents)
final fetchEventsProvider =
    AutoDisposeAsyncNotifierProvider<FetchEvents, List<Event>>.internal(
  FetchEvents.new,
  name: r'fetchEventsProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$fetchEventsHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$FetchEvents = AutoDisposeAsyncNotifier<List<Event>>;
String _$eventsNotifierHash() => r'8aa5e551bfb7d6c1169d92084fdbbe0586ed512b';

/// See also [EventsNotifier].
@ProviderFor(EventsNotifier)
final eventsNotifierProvider =
    AutoDisposeNotifierProvider<EventsNotifier, void>.internal(
  EventsNotifier.new,
  name: r'eventsNotifierProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$eventsNotifierHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$EventsNotifier = AutoDisposeNotifier<void>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
