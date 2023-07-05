import 'package:cached_network_image/cached_network_image.dart';
import 'package:discover_ethiopia/components/custom_app_bar.dart';
import 'package:discover_ethiopia/constants/api.dart';
import 'package:discover_ethiopia/constants/colors.dart';
import 'package:discover_ethiopia/controllers/places/place_controller.dart';
import 'package:discover_ethiopia/controllers/review/review_controller.dart';
import 'package:discover_ethiopia/models/place/place.dart';
import 'package:discover_ethiopia/models/review/review_model.dart';
import 'package:discover_ethiopia/screens/components/ErrorAlert.dart';
import 'package:discover_ethiopia/state/auth_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:icons_plus/icons_plus.dart';

class ReviewPage extends HookConsumerWidget {
  const ReviewPage({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var rating = useState(0.0);
    final place = ref.watch(currentPlaceProvider);
    final authState = ref.watch(authStateProvider);
    final reviews = ref.watch(placeReviewProvider);
    final size = MediaQuery.of(context).size;
    final commentController = useTextEditingController();
    final addReviewMutaton = ref.watch(postReviewProvider);

    return Scaffold(
      body: SafeArea(
        child: reviews.when(
            data: (data) {
              return CustomScrollView(
                slivers: [
                  const SliverToBoxAdapter(
                    child: CustomAppBar(title: 'Reviews'),
                  ),
                  SliverToBoxAdapter(
                    child: Container(
                      margin: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 10),
                      padding: const EdgeInsets.all(24),
                      decoration: BoxDecoration(
                        color: KPrimaryColor.shade500,
                        borderRadius: BorderRadius.circular(20),
                        boxShadow: [
                          BoxShadow(
                            color: KPrimaryColor.shade400.withOpacity(0.5),
                            offset: const Offset(0, 4),
                            blurRadius: 25,
                          ),
                        ],
                      ),
                      child: Column(
                        children: [
                          Row(
                            children: [
                              Text(
                                "Rating · ${data.rating}",
                                style: const TextStyle(
                                  fontSize: 24,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          for (int i = 5; i >= 1; i--)
                            ratingRow(
                                "$i",
                                data.reviews!.isNotEmpty
                                    ? (data.counts!["$i"]! /
                                        data.reviews!.length)
                                    : 0.0),
                        ],
                      ),
                    ),
                  ),
                  if (authState.user != null)
                    SliverToBoxAdapter(
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 20,
                          vertical: 30,
                        ),
                        child: Column(
                          children: [
                            Text(
                              "Please rate your experience at this place",
                              style: TextStyle(
                                fontSize: 18,
                                color: Colors.grey.shade700,
                              ),
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            RatingBar.builder(
                              unratedColor: KPrimaryColor.shade300,
                              initialRating: rating.value / 1.0,
                              itemCount: 5,
                              direction: Axis.horizontal,
                              allowHalfRating: false,
                              itemBuilder: (context, index) => Icon(
                                index < rating.value
                                    ? Bootstrap.star_fill
                                    : Bootstrap.star,
                                color: KPrimaryColor.shade300,
                              ),
                              itemPadding: const EdgeInsets.only(left: 14),
                              onRatingUpdate: (value) {
                                rating.value = value;
                                showDialog(
                                    context: context,
                                    builder: (context) {
                                      return SimpleDialog(
                                        insetPadding: const EdgeInsets.all(20),
                                        contentPadding:
                                            const EdgeInsets.all(20),
                                        // title: const Text("Write your comment"),
                                        children: [
                                          Container(
                                            padding: const EdgeInsets.symmetric(
                                                horizontal: 10, vertical: 5),
                                            decoration: BoxDecoration(
                                              color: KPrimaryColor.shade100
                                                  .withOpacity(0.2),
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                            ),
                                            child: Column(
                                              children: [
                                                TextField(
                                                  controller: commentController,
                                                  minLines: 4,
                                                  maxLines: 6,
                                                  decoration: InputDecoration(
                                                    border: InputBorder.none,
                                                    hintText:
                                                        "Enter Your Comment",
                                                  ),
                                                ),
                                                const SizedBox(
                                                  height: 30,
                                                ),
                                                Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.end,
                                                  children: [
                                                    FilledButton.icon(
                                                      icon: const Icon(
                                                        Iconsax.send_1,
                                                        size: 16,
                                                      ),
                                                      onPressed: () {
                                                        ref
                                                            .read(
                                                                postReviewProvider
                                                                    .notifier)
                                                            .postReview(
                                                              placeId:
                                                                  place?.id ??
                                                                      0,
                                                              rating: rating
                                                                  .value
                                                                  .round(),
                                                              comment:
                                                                  commentController
                                                                      .text,
                                                            );
                                                      },
                                                      label: Text(
                                                          addReviewMutaton
                                                                  .isLoading
                                                              ? "Posting..."
                                                              : 'Post Review'),
                                                    )
                                                  ],
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      );
                                    });
                              },
                            )
                          ],
                        ),
                      ),
                    )
                  else
                    SliverToBoxAdapter(
                      child: Container(
                        padding: const EdgeInsets.all(20),
                        margin: const EdgeInsets.symmetric(
                            horizontal: 20, vertical: 20),
                        decoration: BoxDecoration(
                          color: KPrimaryColor.shade100.withOpacity(0.2),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Column(
                          children: [
                            const Text(
                              "Please log in to share your thoughts and feedback about this location.",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 16,
                                color: KPrimaryColor.shade900,
                              ),
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            FilledButton.icon(
                              onPressed: () {
                                ref.read(authStateProvider.notifier).login();
                              },
                              icon: const Icon(BoxIcons.bxl_google),
                              label: Text("Sign In with Google"),
                            ),
                          ],
                        ),
                      ),
                    ),
                  SliverList.separated(
                    separatorBuilder: (context, index) => Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Divider(
                          color: KPrimaryColor.shade100.withOpacity(0.2)),
                    ),
                    itemCount: data.reviews?.length,
                    itemBuilder: (context, index) {
                      final current = data.reviews![index];
                      return Container(
                        padding: const EdgeInsets.all(20),
                        child: Column(
                          children: [
                            Row(
                              children: [
                                CircleAvatar(
                                  radius: 30,
                                  backgroundImage: CachedNetworkImageProvider(
                                    current.user?.photoURL ?? '',
                                  ),
                                ),
                                const SizedBox(
                                  width: 15,
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      '${current.user?.displayName}',
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 20,
                                        color: Colors.grey.shade800,
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 2,
                                    ),
                                    RatingBar.builder(
                                      initialRating: 5,
                                      ignoreGestures: true,
                                      itemCount: 5,
                                      itemSize: 16,
                                      itemBuilder: (context, index) => Icon(
                                        index <
                                                (int.parse(
                                                    current.rating ?? '0'))
                                            ? Icons.star
                                            : Icons.star_outline,
                                        color: KPrimaryColor.shade300,
                                      ),
                                      onRatingUpdate: (value) {},
                                    ),
                                  ],
                                )
                              ],
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            Text(
                              '${current.comment}',
                              style: TextStyle(
                                fontWeight: FontWeight.w400,
                                fontSize: 16,
                                height: 1.5,
                                color: Colors.grey.shade700,
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ],
              );
            },
            error: (error, stacktrace) => ErrorAlert(
                title: "err",
                desc: 'load_review_fail',
                onRetry: () => ref.invalidate(placeReviewProvider)),
            loading: () => const Center(
                  child: CircularProgressIndicator(),
                )),
      ),
    );
  }

  Row ratingRow(String label, double factor) {
    return Row(
      children: [
        Text(
          label,
          style: const TextStyle(
            fontSize: 24,
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(
          width: 20,
        ),
        Expanded(
          child: Stack(
            children: [
              Container(
                height: 10,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.white.withOpacity(0.3),
                ),
              ),
              FractionallySizedBox(
                widthFactor: factor,
                child: Container(
                  height: 10,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
