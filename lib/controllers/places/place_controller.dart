import 'package:discover_ethiopia/constants/api.dart';
import 'package:discover_ethiopia/controllers/categories/categories_controller.dart';
import 'package:discover_ethiopia/models/place/place.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'place_controller.g.dart';

@riverpod
Future<List<Place>> popularPlaces(Ref ref) async {
  var dio = ref.read(dioProvider);
  var res = await dio.get('$phpUrl/place/popular/index.php');
  List data = res.data!;
  return data.map(Place.fromJson).toList();
}

@riverpod
Future<List<Place>> categoryPlaces(Ref ref) async {
  final dio = ref.read(dioProvider);
  final currentCategory = ref.watch(currentCategoryProvider);

  var res = await dio.get('$phpUrl/category?id=${currentCategory?.id ?? '0'}');
  Map<String, dynamic> data = res.data!;
  List places = data['places']!;
  return places.map(Place.fromJson).toList();
}

@Riverpod(keepAlive: true)
class currentPlace extends _$currentPlace {
  @override
  Place? build() {
    return null;
  }

  setCurrentPlace(Place place) {
    state = place;
  }
}

@Riverpod(keepAlive: true)
Future<List<Place>> searchPlace(Ref ref, {required String keyword}) async {
  final dio = ref.read(dioProvider);
  var res = await dio.get('$phpUrl/place/search/index.php?keyword=${keyword}');
  List places = res.data;
  return places.map(Place.fromJson).toList();
}
