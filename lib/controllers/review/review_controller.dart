import 'package:discover_ethiopia/constants/api.dart';
import 'package:discover_ethiopia/controllers/places/place_controller.dart';
import 'package:discover_ethiopia/models/review/review_model.dart';
import 'package:discover_ethiopia/state/auth_state.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'review_controller.g.dart';

@riverpod
Future<ReviewModel> placeReview(Ref ref) async {
  var dio = ref.read(dioProvider);
  var place = ref.watch(currentPlaceProvider);
  var res = await dio.get('$phpUrl/reviews/index.php?placeId=${place?.id}');
  Map<String, dynamic> data = res.data;
  return ReviewModel.fromJson(data);
}

@riverpod
class PostReview extends _$PostReview {
  @override
  FutureOr<void>? build() {
    return null;
  }

  Future<void> postReview(
      {required int placeId,
      required int rating,
      required String comment}) async {
    var authState = ref.read(authStateProvider);
    if (authState.user != null) {
      var dio = ref.read(dioProvider);
      state = const AsyncLoading();
      var res = await dio.post('$phpUrl/reviews/index.php', data: {
        "placeId": placeId,
        "uid": authState.user?.uid,
        "rating": rating,
        "comment": comment,
      });
      print(res.data);
      state = AsyncValue.data(res.data);
    }
  }
}
