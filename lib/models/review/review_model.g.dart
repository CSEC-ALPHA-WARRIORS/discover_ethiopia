// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'review_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_ReviewResponse _$$_ReviewResponseFromJson(Map<String, dynamic> json) =>
    _$_ReviewResponse(
      counts: (json['counts'] as Map<String, dynamic>?)?.map(
        (k, e) => MapEntry(k, e as int),
      ),
      rating: (json['rating'] as num?)?.toDouble(),
      reviews: (json['reviews'] as List<dynamic>?)
          ?.map((e) => Review.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$_ReviewResponseToJson(_$_ReviewResponse instance) =>
    <String, dynamic>{
      'counts': instance.counts,
      'rating': instance.rating,
      'reviews': instance.reviews,
    };

_$_Review _$$_ReviewFromJson(Map<String, dynamic> json) => _$_Review(
      rating: json['rating'] as String?,
      comment: json['comment'] as String?,
      user: json['user'] == null
          ? null
          : User.fromJson(json['user'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$_ReviewToJson(_$_Review instance) => <String, dynamic>{
      'rating': instance.rating,
      'comment': instance.comment,
      'user': instance.user,
    };

_$_User _$$_UserFromJson(Map<String, dynamic> json) => _$_User(
      id: json['id'] as int?,
      displayName: json['displayName'] as String?,
      photoURL: json['photoURL'] as String?,
      email: json['email'] as String?,
    );

Map<String, dynamic> _$$_UserToJson(_$_User instance) => <String, dynamic>{
      'id': instance.id,
      'displayName': instance.displayName,
      'photoURL': instance.photoURL,
      'email': instance.email,
    };
