// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'categories_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$categoriesHash() => r'01f50ca286ea1a26ad781edf41a8a24ffc741f76';

/// See also [categories].
@ProviderFor(categories)
final categoriesProvider = AutoDisposeFutureProvider<List<Category>>.internal(
  categories,
  name: r'categoriesProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$categoriesHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef CategoriesRef = AutoDisposeFutureProviderRef<List<Category>>;
String _$currentCategoryHash() => r'87814f28104015f7c1ba8e1fc3b01ba8cb8ee38c';

/// See also [currentCategory].
@ProviderFor(currentCategory)
final currentCategoryProvider =
    NotifierProvider<currentCategory, Category?>.internal(
  currentCategory.new,
  name: r'currentCategoryProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$currentCategoryHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$currentCategory = Notifier<Category?>;
// ignore_for_file: unnecessary_raw_strings, subtype_of_sealed_class, invalid_use_of_internal_member, do_not_use_environment, prefer_const_constructors, public_member_api_docs, avoid_private_typedef_functions
