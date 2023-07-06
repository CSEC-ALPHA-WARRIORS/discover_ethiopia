// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'review_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_ReviewModel _$$_ReviewModelFromJson(Map<String, dynamic> json) =>
    _$_ReviewModel(
      reviews: (json['reviews'] as List<dynamic>?)
          ?.map((e) => Review.fromJson(e as Map<String, dynamic>))
          .toList(),
      rating: (json['rating'] as num?)?.toDouble(),
      message: json['message'] as String?,
      count: (json['count'] as Map<String, dynamic>?)?.map(
        (k, e) => MapEntry(k, e as int),
      ),
    );

Map<String, dynamic> _$$_ReviewModelToJson(_$_ReviewModel instance) =>
    <String, dynamic>{
      'reviews': instance.reviews,
      'rating': instance.rating,
      'message': instance.message,
      'count': instance.count,
    };

_$_Review _$$_ReviewFromJson(Map<String, dynamic> json) => _$_Review(
      comment: json['comment'] as String?,
      rating: json['rating'] as String?,
      user: (json['user'] as List<dynamic>?)
          ?.map((e) => User.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$_ReviewToJson(_$_Review instance) => <String, dynamic>{
      'comment': instance.comment,
      'rating': instance.rating,
      'user': instance.user,
    };

_$_User _$$_UserFromJson(Map<String, dynamic> json) => _$_User(
      id: json['id'] as int?,
      name: json['name'] as String?,
      email: json['email'] as String?,
      password: json['password'] as String?,
      photoUrl: json['photoUrl'] as String?,
      role: json['role'] as String?,
    );

Map<String, dynamic> _$$_UserToJson(_$_User instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'email': instance.email,
      'password': instance.password,
      'photoUrl': instance.photoUrl,
      'role': instance.role,
    };
