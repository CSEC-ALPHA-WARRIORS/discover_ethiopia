import 'package:freezed_annotation/freezed_annotation.dart';
part 'category.freezed.dart';
part 'category.g.dart';

@freezed
class Category with _$Category {
  const factory Category(
      {required int id,
      required String name,
      required String desc,
      required String cover_pic_url}) = _Category;

  factory Category.fromJson(dynamic json) => _$CategoryFromJson(json);
}
