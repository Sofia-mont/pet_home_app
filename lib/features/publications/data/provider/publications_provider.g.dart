// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'publications_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$fetchFilteredPostsHash() =>
    r'e52f5410b3ae95e2ec3fa6c6ca0559321cab3c22';

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

abstract class _$FetchFilteredPosts
    extends BuildlessAutoDisposeAsyncNotifier<List<Post>> {
  late final PublicationsResponseQuery? filters;

  FutureOr<List<Post>> build(
    PublicationsResponseQuery? filters,
  );
}

/// See also [FetchFilteredPosts].
@ProviderFor(FetchFilteredPosts)
const fetchFilteredPostsProvider = FetchFilteredPostsFamily();

/// See also [FetchFilteredPosts].
class FetchFilteredPostsFamily extends Family<AsyncValue<List<Post>>> {
  /// See also [FetchFilteredPosts].
  const FetchFilteredPostsFamily();

  /// See also [FetchFilteredPosts].
  FetchFilteredPostsProvider call(
    PublicationsResponseQuery? filters,
  ) {
    return FetchFilteredPostsProvider(
      filters,
    );
  }

  @override
  FetchFilteredPostsProvider getProviderOverride(
    covariant FetchFilteredPostsProvider provider,
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
  String? get name => r'fetchFilteredPostsProvider';
}

/// See also [FetchFilteredPosts].
class FetchFilteredPostsProvider extends AutoDisposeAsyncNotifierProviderImpl<
    FetchFilteredPosts, List<Post>> {
  /// See also [FetchFilteredPosts].
  FetchFilteredPostsProvider(
    PublicationsResponseQuery? filters,
  ) : this._internal(
          () => FetchFilteredPosts()..filters = filters,
          from: fetchFilteredPostsProvider,
          name: r'fetchFilteredPostsProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$fetchFilteredPostsHash,
          dependencies: FetchFilteredPostsFamily._dependencies,
          allTransitiveDependencies:
              FetchFilteredPostsFamily._allTransitiveDependencies,
          filters: filters,
        );

  FetchFilteredPostsProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.filters,
  }) : super.internal();

  final PublicationsResponseQuery? filters;

  @override
  FutureOr<List<Post>> runNotifierBuild(
    covariant FetchFilteredPosts notifier,
  ) {
    return notifier.build(
      filters,
    );
  }

  @override
  Override overrideWith(FetchFilteredPosts Function() create) {
    return ProviderOverride(
      origin: this,
      override: FetchFilteredPostsProvider._internal(
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
  AutoDisposeAsyncNotifierProviderElement<FetchFilteredPosts, List<Post>>
      createElement() {
    return _FetchFilteredPostsProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is FetchFilteredPostsProvider && other.filters == filters;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, filters.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin FetchFilteredPostsRef on AutoDisposeAsyncNotifierProviderRef<List<Post>> {
  /// The parameter `filters` of this provider.
  PublicationsResponseQuery? get filters;
}

class _FetchFilteredPostsProviderElement
    extends AutoDisposeAsyncNotifierProviderElement<FetchFilteredPosts,
        List<Post>> with FetchFilteredPostsRef {
  _FetchFilteredPostsProviderElement(super.provider);

  @override
  PublicationsResponseQuery? get filters =>
      (origin as FetchFilteredPostsProvider).filters;
}

String _$myPostListHash() => r'cd175fbf97d61f21ac0580aa7574dc3ddab97d44';

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
