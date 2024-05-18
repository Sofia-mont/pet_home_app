// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'adoption_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$adoptionFormsListHash() => r'f907e1e8685240d77e6d126b299ac530593b35e1';

/// Copied from Dart SDK
class _SystemHash {
  _SystemHash._();

  static int combine(int hash, int value) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + value);
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x0007ffff & hash) << 10));
    return hash ^ (hash >> 6);
  }

  static int finish(int hash) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x03ffffff & hash) << 3));
    // ignore: parameter_assignments
    hash = hash ^ (hash >> 11);
    return 0x1fffffff & (hash + ((0x00003fff & hash) << 15));
  }
}

abstract class _$AdoptionFormsList
    extends BuildlessAutoDisposeAsyncNotifier<List<FormAdoptionProjection>> {
  late final PostulationSearchQuery? filters;

  FutureOr<List<FormAdoptionProjection>> build(
    PostulationSearchQuery? filters,
  );
}

/// See also [AdoptionFormsList].
@ProviderFor(AdoptionFormsList)
const adoptionFormsListProvider = AdoptionFormsListFamily();

/// See also [AdoptionFormsList].
class AdoptionFormsListFamily
    extends Family<AsyncValue<List<FormAdoptionProjection>>> {
  /// See also [AdoptionFormsList].
  const AdoptionFormsListFamily();

  /// See also [AdoptionFormsList].
  AdoptionFormsListProvider call(
    PostulationSearchQuery? filters,
  ) {
    return AdoptionFormsListProvider(
      filters,
    );
  }

  @override
  AdoptionFormsListProvider getProviderOverride(
    covariant AdoptionFormsListProvider provider,
  ) {
    return call(
      provider.filters,
    );
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'adoptionFormsListProvider';
}

/// See also [AdoptionFormsList].
class AdoptionFormsListProvider extends AutoDisposeAsyncNotifierProviderImpl<
    AdoptionFormsList, List<FormAdoptionProjection>> {
  /// See also [AdoptionFormsList].
  AdoptionFormsListProvider(
    PostulationSearchQuery? filters,
  ) : this._internal(
          () => AdoptionFormsList()..filters = filters,
          from: adoptionFormsListProvider,
          name: r'adoptionFormsListProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$adoptionFormsListHash,
          dependencies: AdoptionFormsListFamily._dependencies,
          allTransitiveDependencies:
              AdoptionFormsListFamily._allTransitiveDependencies,
          filters: filters,
        );

  AdoptionFormsListProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.filters,
  }) : super.internal();

  final PostulationSearchQuery? filters;

  @override
  FutureOr<List<FormAdoptionProjection>> runNotifierBuild(
    covariant AdoptionFormsList notifier,
  ) {
    return notifier.build(
      filters,
    );
  }

  @override
  Override overrideWith(AdoptionFormsList Function() create) {
    return ProviderOverride(
      origin: this,
      override: AdoptionFormsListProvider._internal(
        () => create()..filters = filters,
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        filters: filters,
      ),
    );
  }

  @override
  AutoDisposeAsyncNotifierProviderElement<AdoptionFormsList,
      List<FormAdoptionProjection>> createElement() {
    return _AdoptionFormsListProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is AdoptionFormsListProvider && other.filters == filters;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, filters.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin AdoptionFormsListRef
    on AutoDisposeAsyncNotifierProviderRef<List<FormAdoptionProjection>> {
  /// The parameter `filters` of this provider.
  PostulationSearchQuery? get filters;
}

class _AdoptionFormsListProviderElement
    extends AutoDisposeAsyncNotifierProviderElement<AdoptionFormsList,
        List<FormAdoptionProjection>> with AdoptionFormsListRef {
  _AdoptionFormsListProviderElement(super.provider);

  @override
  PostulationSearchQuery? get filters =>
      (origin as AdoptionFormsListProvider).filters;
}

String _$adoptionNotifierHash() => r'f5e9164fba423e2e19d6719371e70397eaee53e4';

/// See also [AdoptionNotifier].
@ProviderFor(AdoptionNotifier)
final adoptionNotifierProvider =
    AutoDisposeNotifierProvider<AdoptionNotifier, void>.internal(
  AdoptionNotifier.new,
  name: r'adoptionNotifierProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$adoptionNotifierHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$AdoptionNotifier = AutoDisposeNotifier<void>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
