import 'package:freezed_annotation/freezed_annotation.dart';

part 'review_model.freezed.dart';
part 'review_model.g.dart';

@freezed
class ReviewResponse with _$ReviewResponse {
  factory ReviewResponse({
    Map<String, int>? counts,
    double? rating,
    List<Review>? reviews,
  }) = _ReviewResponse;

  factory ReviewResponse.fromJson(Map<String, dynamic> json) =>
      _$ReviewResponseFromJson(json);
}

@freezed
class Review with _$Review {
  factory Review({
    String? rating,
    String? comment,
    User? user,
  }) = _Review;

  factory Review.fromJson(Map<String, dynamic> json) => _$ReviewFromJson(json);
}

@freezed
class User with _$User {
  factory User({
    int? id,
    String? displayName,
    String? photoURL,
    String? email,
  }) = _User;

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);
}
