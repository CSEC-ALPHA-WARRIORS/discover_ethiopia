import 'package:freezed_annotation/freezed_annotation.dart';

part 'review_model.freezed.dart';
part 'review_model.g.dart';

@freezed
class ReviewModel with _$ReviewModel {
  factory ReviewModel({
    List<Review>? reviews,
    double? rating,
    String? message,
    Map<String, int>? count,
  }) = _ReviewModel;

  factory ReviewModel.fromJson(Map<String, dynamic> json) =>
      _$ReviewModelFromJson(json);
}

@freezed
class Review with _$Review {
  factory Review({
    String? comment,
    String? rating,
    List<User>? user,
  }) = _Review;

  factory Review.fromJson(Map<String, dynamic> json) => _$ReviewFromJson(json);
}

@freezed
class User with _$User {
  factory User({
    int? id,
    String? name,
    String? email,
    String? password,
    String? photoUrl,
    String? role,
  }) = _User;

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);
}
