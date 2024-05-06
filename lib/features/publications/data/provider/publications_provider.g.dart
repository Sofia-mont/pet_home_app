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

String _$postPetHash() => r'5b575e2f7b94581b7a7aa495b69324589fad512f';

/// See also [postPet].
@ProviderFor(postPet)
const postPetProvider = PostPetFamily();

/// See also [postPet].
class PostPetFamily extends Family<AsyncValue<void>> {
  /// See also [postPet].
  const PostPetFamily();

  /// See also [postPet].
  PostPetProvider call({
    required BuildContext context,
    required PostRequest request,
  }) {
    return PostPetProvider(
      context: context,
      request: request,
    );
  }

  @override
  PostPetProvider getProviderOverride(
    covariant PostPetProvider provider,
  ) {
    return call(
      context: provider.context,
      request: provider.request,
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
  String? get name => r'postPetProvider';
}

/// See also [postPet].
class PostPetProvider extends AutoDisposeFutureProvider<void> {
  /// See also [postPet].
  PostPetProvider({
    required BuildContext context,
    required PostRequest request,
  }) : this._internal(
          (ref) => postPet(
            ref as PostPetRef,
            context: context,
            request: request,
          ),
          from: postPetProvider,
          name: r'postPetProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$postPetHash,
          dependencies: PostPetFamily._dependencies,
          allTransitiveDependencies: PostPetFamily._allTransitiveDependencies,
          context: context,
          request: request,
        );

  PostPetProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.context,
    required this.request,
  }) : super.internal();

  final BuildContext context;
  final PostRequest request;

  @override
  Override overrideWith(
    FutureOr<void> Function(PostPetRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: PostPetProvider._internal(
        (ref) => create(ref as PostPetRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        context: context,
        request: request,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<void> createElement() {
    return _PostPetProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is PostPetProvider &&
        other.context == context &&
        other.request == request;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, context.hashCode);
    hash = _SystemHash.combine(hash, request.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin PostPetRef on AutoDisposeFutureProviderRef<void> {
  /// The parameter `context` of this provider.
  BuildContext get context;

  /// The parameter `request` of this provider.
  PostRequest get request;
}

class _PostPetProviderElement extends AutoDisposeFutureProviderElement<void>
    with PostPetRef {
  _PostPetProviderElement(super.provider);

  @override
  BuildContext get context => (origin as PostPetProvider).context;
  @override
  PostRequest get request => (origin as PostPetProvider).request;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
