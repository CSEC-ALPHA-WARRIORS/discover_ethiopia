import 'package:discover_ethiopia/constants/api.dart';
import 'package:discover_ethiopia/models/place/place.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'place_controller.g.dart';

@riverpod
Future<List<Place>> popularPlaces(Ref ref) async {
  var dio = ref.read(dioProvider);
  var res = await dio.get('$baseURL/popular');
  List data = res.data!;
  return data.map(Place.fromJson).toList();
}
