import 'package:auto_size_text/auto_size_text.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:discover_ethiopia/controllers/places/place_controller.dart';
import 'package:discover_ethiopia/models/place/place.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:icons_plus/icons_plus.dart';

import '../../constants/colors.dart';

class PopularPlaceItem extends HookConsumerWidget {
  const PopularPlaceItem({super.key, required this.place});

  final Place place;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var size = MediaQuery.of(context).size;
    var eng = place.descriptions!
        .where((element) => element.language == 'en')
        .toList();
    var desc = eng.isNotEmpty ? eng.first.content : "";

    return GestureDetector(
      onTap: () {
        ref.read(currentPlaceProvider.notifier).setCurrentPlace(place);
        context.push("/home/place-details");
      },
      child: Container(
        width: size.width * .75,
        margin: const EdgeInsets.only(
          bottom: 40,
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              blurRadius: 10,
              color: KPrimaryColor.shade100.withOpacity(0.1),
              offset: const Offset(0, 1),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            ClipRRect(
              borderRadius:
                  const BorderRadius.vertical(top: Radius.circular(20)),
              child: CachedNetworkImage(
                imageUrl: place.photos?[0] ?? "",
                height: 250,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                vertical: 2.0,
                horizontal: 20,
              ).copyWith(top: 10),
              child: Row(
                children: [
                  Expanded(
                    child: AutoSizeText(
                      place.title ?? "",
                      maxLines: 1,
                      style: const TextStyle(
                        color: Colors.black87,
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const Icon(
                        Bootstrap.star_fill,
                        color: KPrimaryColor.shade100,
                        size: 20,
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Text(
                        '${place.rating}',
                        style: const TextStyle(
                          color: KPrimaryColor.shade100,
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 20).copyWith(top: 10),
              child: Text(
                '${desc!.length > 60 ? desc?.substring(0, 60) : desc}...',
                style: const TextStyle(
                  color: Colors.black54,
                  fontSize: 16,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
