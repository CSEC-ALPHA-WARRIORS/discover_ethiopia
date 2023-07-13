import 'package:cached_network_image/cached_network_image.dart';
import 'package:discover_ethiopia/constants/colors.dart';
import 'package:discover_ethiopia/controllers/places/place_controller.dart';
import 'package:discover_ethiopia/models/place/place.dart';
import 'package:fade_shimmer/fade_shimmer.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:icons_plus/icons_plus.dart';

class PlaceListItemLoader extends StatelessWidget {
  const PlaceListItemLoader({
    super.key,
    required this.index,
  });

  final int index;

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Container(
      // height: size.width * .4,
      width: size.width,
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          FadeShimmer(
            millisecondsDelay: index * 100,
            width: size.width * .4,
            height: size.width * .4,
            highlightColor: KPrimaryColor.shade100,
            fadeTheme: FadeTheme.light,
            radius: 10,
          ),
          const SizedBox(
            width: 20,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                FadeShimmer(
                  width: size.width * 7,
                  height: 20,
                  fadeTheme: FadeTheme.light,
                  radius: 4,
                ),
                const SizedBox(
                  height: 10,
                ),
                FadeShimmer(
                  width: size.width * .3,
                  height: 10,
                  fadeTheme: FadeTheme.light,
                  radius: 4,
                ),
                const SizedBox(
                  height: 20,
                ),
                FadeShimmer(
                  width: size.width,
                  height: size.width * .2,
                  fadeTheme: FadeTheme.light,
                  radius: 4,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class PlaceListItem extends HookConsumerWidget {
  const PlaceListItem({
    super.key,
    required this.place,
  });

  final Place place;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var size = MediaQuery.of(context).size;

    var eng = place.descriptions!
        .where((element) => element.language == 'en')
        .toList();
    var desc = eng.isNotEmpty ? eng.first.content : "";

    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20),
      child: InkWell(
        borderRadius: BorderRadius.circular(10),
        onTap: () {
          ref.read(currentPlaceProvider.notifier).setCurrentPlace(place);
          context.push('/home/place-details');
        },
        child: Ink(
          height: size.width * .45,
          width: size.width,
          padding: const EdgeInsets.all(8.0),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: CachedNetworkImage(
                  imageUrl: place.photos?[0] ?? "",
                  width: size.width * .4,
                  fit: BoxFit.cover,
                ),
              ),
              const SizedBox(
                width: 20,
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Text(
                      place.title ?? "",
                      style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    Text(
                      ethiopiaRegions[(place?.region ?? 1) - 1],
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.grey,
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Expanded(
                      child: Text(
                        desc ?? "",
                        overflow: TextOverflow.clip,
                        maxLines: 2,
                        softWrap: true,
                        style: TextStyle(
                          color: Colors.grey.shade700,
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            const Icon(
                              Iconsax.location,
                              size: 20,
                              color: KPrimaryColor.shade400,
                            ),
                            const SizedBox(
                              width: 5,
                            ),
                            Text(
                              '${place.distance} KM',
                              style: const TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: KPrimaryColor.shade400,
                              ),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            const Icon(
                              Bootstrap.star_fill,
                              size: 17,
                              color: KPrimaryColor.shade400,
                            ),
                            const SizedBox(
                              width: 8,
                            ),
                            Text(
                              '${place.rating}',
                              style: const TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: KPrimaryColor.shade400,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
