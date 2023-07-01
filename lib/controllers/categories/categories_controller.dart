import 'package:dio/dio.dart';
import 'package:discover_ethiopia/constants/api.dart';
import 'package:discover_ethiopia/models/category/category.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'categories_controller.g.dart';

@riverpod
Future<List<Category>> categories(Ref ref) async {
  var dio = ref.read(dioProvider);
  Response<List<dynamic>> res = await dio.get('$baseURL/categories');
  List data = res.data!;
  return data.map(Category.fromJson).toList();
}
