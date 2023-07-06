// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'place_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$popularPlacesHash() => r'52d6196f1140f355cbc1f3afed0e45c700fe5a52';

/// See also [popularPlaces].
@ProviderFor(popularPlaces)
final popularPlacesProvider = AutoDisposeFutureProvider<List<Place>>.internal(
  popularPlaces,
  name: r'popularPlacesProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$popularPlacesHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef PopularPlacesRef = AutoDisposeFutureProviderRef<List<Place>>;
String _$categoryPlacesHash() => r'96a1b99bb52acd9377881c550e17e618d746f869';

/// See also [categoryPlaces].
@ProviderFor(categoryPlaces)
final categoryPlacesProvider = AutoDisposeFutureProvider<List<Place>>.internal(
  categoryPlaces,
  name: r'categoryPlacesProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$categoryPlacesHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef CategoryPlacesRef = AutoDisposeFutureProviderRef<List<Place>>;
String _$searchPlaceHash() => r'e5c07e5624455572817c2c90e26e3a196ca32d8b';

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

typedef SearchPlaceRef = FutureProviderRef<List<Place>>;

/// See also [searchPlace].
@ProviderFor(searchPlace)
const searchPlaceProvider = SearchPlaceFamily();

/// See also [searchPlace].
class SearchPlaceFamily extends Family<AsyncValue<List<Place>>> {
  /// See also [searchPlace].
  const SearchPlaceFamily();

  /// See also [searchPlace].
  SearchPlaceProvider call({
    required String keyword,
  }) {
    return SearchPlaceProvider(
      keyword: keyword,
    );
  }

  @override
  SearchPlaceProvider getProviderOverride(
    covariant SearchPlaceProvider provider,
  ) {
    return call(
      keyword: provider.keyword,
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
  String? get name => r'searchPlaceProvider';
}

/// See also [searchPlace].
class SearchPlaceProvider extends FutureProvider<List<Place>> {
  /// See also [searchPlace].
  SearchPlaceProvider({
    required this.keyword,
  }) : super.internal(
          (ref) => searchPlace(
            ref,
            keyword: keyword,
          ),
          from: searchPlaceProvider,
          name: r'searchPlaceProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$searchPlaceHash,
          dependencies: SearchPlaceFamily._dependencies,
          allTransitiveDependencies:
              SearchPlaceFamily._allTransitiveDependencies,
        );

  final String keyword;

  @override
  bool operator ==(Object other) {
    return other is SearchPlaceProvider && other.keyword == keyword;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, keyword.hashCode);

    return _SystemHash.finish(hash);
  }
}

String _$currentPlaceHash() => r'f1442c7257276d8ebc912fa8fb50c18d708b8f02';

/// See also [currentPlace].
@ProviderFor(currentPlace)
final currentPlaceProvider = NotifierProvider<currentPlace, Place?>.internal(
  currentPlace.new,
  name: r'currentPlaceProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$currentPlaceHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$currentPlace = Notifier<Place?>;
// ignore_for_file: unnecessary_raw_strings, subtype_of_sealed_class, invalid_use_of_internal_member, do_not_use_environment, prefer_const_constructors, public_member_api_docs, avoid_private_typedef_functions
