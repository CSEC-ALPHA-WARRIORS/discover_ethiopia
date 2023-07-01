import 'package:freezed_annotation/freezed_annotation.dart';

part 'place.freezed.dart';
part 'place.g.dart';

@freezed
class Place with _$Place {
  const factory Place({
    required int id,
    required String title,
    required double latitude,
    required double longitude,
    required String region,
    required int distance,
    required List<Description> descriptions,
    required List<String> photos,
    required double rating,
  }) = _Place;

  factory Place.fromJson(dynamic json) => _$PlaceFromJson(json);
}

@freezed
class Description with _$Description {
  const factory Description({
    required String language,
    required String content,
  }) = _Description;
  factory Description.fromJson(dynamic json) => _$DescriptionFromJson(json);
}
