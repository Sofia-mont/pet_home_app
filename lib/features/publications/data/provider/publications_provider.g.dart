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

String _$myPostListHash() => r'7dccba45ec7ee42d9dbbe7428703585b6b9b099e';

abstract class _$MyPostList
    extends BuildlessAutoDisposeAsyncNotifier<List<Post>> {
  late final String status;

  FutureOr<List<Post>> build(
    String status,
  );
}

/// See also [MyPostList].
@ProviderFor(MyPostList)
const myPostListProvider = MyPostListFamily();

/// See also [MyPostList].
class MyPostListFamily extends Family<AsyncValue<List<Post>>> {
  /// See also [MyPostList].
  const MyPostListFamily();

  /// See also [MyPostList].
  MyPostListProvider call(
    String status,
  ) {
    return MyPostListProvider(
      status,
    );
  }

  @override
  MyPostListProvider getProviderOverride(
    covariant MyPostListProvider provider,
  ) {
    return call(
      provider.status,
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
  String? get name => r'myPostListProvider';
}

/// See also [MyPostList].
class MyPostListProvider
    extends AutoDisposeAsyncNotifierProviderImpl<MyPostList, List<Post>> {
  /// See also [MyPostList].
  MyPostListProvider(
    String status,
  ) : this._internal(
          () => MyPostList()..status = status,
          from: myPostListProvider,
          name: r'myPostListProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$myPostListHash,
          dependencies: MyPostListFamily._dependencies,
          allTransitiveDependencies:
              MyPostListFamily._allTransitiveDependencies,
          status: status,
        );

  MyPostListProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.status,
  }) : super.internal();

  final String status;

  @override
  FutureOr<List<Post>> runNotifierBuild(
    covariant MyPostList notifier,
  ) {
    return notifier.build(
      status,
    );
  }

  @override
  Override overrideWith(MyPostList Function() create) {
    return ProviderOverride(
      origin: this,
      override: MyPostListProvider._internal(
        () => create()..status = status,
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        status: status,
      ),
    );
  }

  @override
  AutoDisposeAsyncNotifierProviderElement<MyPostList, List<Post>>
      createElement() {
    return _MyPostListProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is MyPostListProvider && other.status == status;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, status.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin MyPostListRef on AutoDisposeAsyncNotifierProviderRef<List<Post>> {
  /// The parameter `status` of this provider.
  String get status;
}

class _MyPostListProviderElement
    extends AutoDisposeAsyncNotifierProviderElement<MyPostList, List<Post>>
    with MyPostListRef {
  _MyPostListProviderElement(super.provider);

  @override
  String get status => (origin as MyPostListProvider).status;
}

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
