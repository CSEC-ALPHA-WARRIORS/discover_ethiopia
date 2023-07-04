// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'place_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$popularPlacesHash() => r'033241dbf27263781417b1ea78b64f2b3598a84b';

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
String _$categoryPlacesHash() => r'e557ecb4046ea80216e623984894fb2d8c3e4be7';

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
