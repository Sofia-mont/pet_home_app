// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'publications_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$fetchPublicationsHash() => r'e9c3216b85a942a1a23aaf159902ed7ad12494df';

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

/// See also [fetchPublications].
@ProviderFor(fetchPublications)
const fetchPublicationsProvider = FetchPublicationsFamily();

/// See also [fetchPublications].
class FetchPublicationsFamily extends Family<AsyncValue<PublicationsResponse>> {
  /// See also [fetchPublications].
  const FetchPublicationsFamily();

  /// See also [fetchPublications].
  FetchPublicationsProvider call({
    required int page,
    PublicationsResponseQuery? query,
  }) {
    return FetchPublicationsProvider(
      page: page,
      query: query,
    );
  }

  @override
  FetchPublicationsProvider getProviderOverride(
    covariant FetchPublicationsProvider provider,
  ) {
    return call(
      page: provider.page,
      query: provider.query,
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
  String? get name => r'fetchPublicationsProvider';
}

/// See also [fetchPublications].
class FetchPublicationsProvider
    extends AutoDisposeFutureProvider<PublicationsResponse> {
  /// See also [fetchPublications].
  FetchPublicationsProvider({
    required int page,
    PublicationsResponseQuery? query,
  }) : this._internal(
          (ref) => fetchPublications(
            ref as FetchPublicationsRef,
            page: page,
            query: query,
          ),
          from: fetchPublicationsProvider,
          name: r'fetchPublicationsProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$fetchPublicationsHash,
          dependencies: FetchPublicationsFamily._dependencies,
          allTransitiveDependencies:
              FetchPublicationsFamily._allTransitiveDependencies,
          page: page,
          query: query,
        );

  FetchPublicationsProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.page,
    required this.query,
  }) : super.internal();

  final int page;
  final PublicationsResponseQuery? query;

  @override
  Override overrideWith(
    FutureOr<PublicationsResponse> Function(FetchPublicationsRef provider)
        create,
  ) {
    return ProviderOverride(
      origin: this,
      override: FetchPublicationsProvider._internal(
        (ref) => create(ref as FetchPublicationsRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        page: page,
        query: query,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<PublicationsResponse> createElement() {
    return _FetchPublicationsProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is FetchPublicationsProvider &&
        other.page == page &&
        other.query == query;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, page.hashCode);
    hash = _SystemHash.combine(hash, query.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin FetchPublicationsRef
    on AutoDisposeFutureProviderRef<PublicationsResponse> {
  /// The parameter `page` of this provider.
  int get page;

  /// The parameter `query` of this provider.
  PublicationsResponseQuery? get query;
}

class _FetchPublicationsProviderElement
    extends AutoDisposeFutureProviderElement<PublicationsResponse>
    with FetchPublicationsRef {
  _FetchPublicationsProviderElement(super.provider);

  @override
  int get page => (origin as FetchPublicationsProvider).page;
  @override
  PublicationsResponseQuery? get query =>
      (origin as FetchPublicationsProvider).query;
}

String _$pendingPostListHash() => r'd19240d1daf4b6197f339128ac30e168b84b745b';

/// See also [PendingPostList].
@ProviderFor(PendingPostList)
final pendingPostListProvider =
    AutoDisposeAsyncNotifierProvider<PendingPostList, List<Post>>.internal(
  PendingPostList.new,
  name: r'pendingPostListProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$pendingPostListHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$PendingPostList = AutoDisposeAsyncNotifier<List<Post>>;
String _$adoptedPostListHash() => r'3ffc2179e5c017b2af4f46c5f9f859db6f41ff23';

/// See also [AdoptedPostList].
@ProviderFor(AdoptedPostList)
final adoptedPostListProvider =
    AutoDisposeAsyncNotifierProvider<AdoptedPostList, List<Post>>.internal(
  AdoptedPostList.new,
  name: r'adoptedPostListProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$adoptedPostListHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$AdoptedPostList = AutoDisposeAsyncNotifier<List<Post>>;
String _$publicationsNotifierHash() =>
    r'da8a161031951f892ce23cedcb9be55de5c7a7cc';

/// See also [PublicationsNotifier].
@ProviderFor(PublicationsNotifier)
final publicationsNotifierProvider =
    AutoDisposeNotifierProvider<PublicationsNotifier, void>.internal(
  PublicationsNotifier.new,
  name: r'publicationsNotifierProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$publicationsNotifierHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$PublicationsNotifier = AutoDisposeNotifier<void>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
