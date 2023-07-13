// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'place.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Place _$$_PlaceFromJson(Map<String, dynamic> json) => _$_Place(
      id: json['id'] as int?,
      title: json['title'] as String?,
      latitude: (json['latitude'] as num?)?.toDouble(),
      longitude: (json['longitude'] as num?)?.toDouble(),
      region: json['region'] as int?,
      distance: json['distance'] as int?,
      descriptions: (json['descriptions'] as List<dynamic>?)
          ?.map((e) => Description.fromJson(e as Map<String, dynamic>))
          .toList(),
      photos:
          (json['photos'] as List<dynamic>?)?.map((e) => e as String).toList(),
      recommendations: (json['recommendations'] as List<dynamic>?)
          ?.map((e) => Recommendation.fromJson(e as Map<String, dynamic>))
          .toList(),
      rating: (json['rating'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$$_PlaceToJson(_$_Place instance) => <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'latitude': instance.latitude,
      'longitude': instance.longitude,
      'region': instance.region,
      'distance': instance.distance,
      'descriptions': instance.descriptions,
      'photos': instance.photos,
      'recommendations': instance.recommendations,
      'rating': instance.rating,
    };

_$_Description _$$_DescriptionFromJson(Map<String, dynamic> json) =>
    _$_Description(
      language: json['language'] as String?,
      content: json['content'] as String?,
    );

Map<String, dynamic> _$$_DescriptionToJson(_$_Description instance) =>
    <String, dynamic>{
      'language': instance.language,
      'content': instance.content,
    };

_$_Recommendation _$$_RecommendationFromJson(Map<String, dynamic> json) =>
    _$_Recommendation(
      desc: json['desc'] as String?,
      message: json['message'] as String?,
    );

Map<String, dynamic> _$$_RecommendationToJson(_$_Recommendation instance) =>
    <String, dynamic>{
      'desc': instance.desc,
      'message': instance.message,
    };
