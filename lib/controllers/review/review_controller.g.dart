// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'review_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$placeReviewHash() => r'e126d107039e6f3b7e6f9098a9fe3f376292143d';

/// See also [placeReview].
@ProviderFor(placeReview)
final placeReviewProvider = AutoDisposeFutureProvider<ReviewResponse>.internal(
  placeReview,
  name: r'placeReviewProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$placeReviewHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef PlaceReviewRef = AutoDisposeFutureProviderRef<ReviewResponse>;
String _$postReviewHash() => r'd02775c836e2d3d0c6824dc20d4ebef25f8bdafe';

/// See also [PostReview].
@ProviderFor(PostReview)
final postReviewProvider =
    AutoDisposeAsyncNotifierProvider<PostReview, void>.internal(
  PostReview.new,
  name: r'postReviewProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$postReviewHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$PostReview = AutoDisposeAsyncNotifier<void>;
// ignore_for_file: unnecessary_raw_strings, subtype_of_sealed_class, invalid_use_of_internal_member, do_not_use_environment, prefer_const_constructors, public_member_api_docs, avoid_private_typedef_functions
