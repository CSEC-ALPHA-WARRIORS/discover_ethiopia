import 'package:freezed_annotation/freezed_annotation.dart';

part 'place.freezed.dart';
part 'place.g.dart';

@freezed
class Place with _$Place {
  factory Place({
    int? id,
    String? title,
    double? latitude,
    double? longitude,
    int? region,
    int? distance,
    List<Description>? descriptions,
    List<String>? photos,
    List<Recommendation>? recommendations,
    double? rating,
  }) = _Place;

  factory Place.fromJson(dynamic json) => _$PlaceFromJson(json);
}

@freezed
class Description with _$Description {
  factory Description({
    String? language,
    String? content,
  }) = _Description;

  factory Description.fromJson(Map<String, dynamic> json) =>
      _$DescriptionFromJson(json);
}

@freezed
class Recommendation with _$Recommendation {
  factory Recommendation({
    String? desc,
    String? message,
  }) = _Recommendation;

  factory Recommendation.fromJson(Map<String, dynamic> json) =>
      _$RecommendationFromJson(json);
}

List<String> ethiopiaRegions = [
  'Tigray',
  'Afar',
  'Amhara',
  'Oromia',
  'Somali',
  'Benishangul-Gumuz',
  'Southern Nations, Nationalities, and Peoples\' Region',
  'Gambela',
  'Harari',
  'Dire Dawa',
  'Addis Ababa',
];
