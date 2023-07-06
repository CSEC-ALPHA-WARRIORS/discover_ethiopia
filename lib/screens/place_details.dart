import 'package:auto_size_text/auto_size_text.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:discover_ethiopia/constants/colors.dart';
import 'package:discover_ethiopia/controllers/places/place_controller.dart';
import 'package:discover_ethiopia/models/place/place.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:icons_plus/icons_plus.dart';

class PlaceDetailsPage extends HookConsumerWidget {
  const PlaceDetailsPage({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var place = ref.watch(currentPlaceProvider);
    var size = MediaQuery.of(context).size;
    var carousel_index = useState(0);
    var descs = place!.descriptions!
        .where((d) => d.language == context.locale.toString())
        .toList();
    var desc = descs!.isNotEmpty
        ? descs[0]
        : place.descriptions!.isNotEmpty
            ? place.descriptions![0]
            : Description(content: "", language: "en");
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 0,
        systemOverlayStyle: const SystemUiOverlayStyle(
          statusBarColor: Colors.transparent,
          statusBarBrightness: Brightness.dark,
          statusBarIconBrightness: Brightness.dark,
        ),
      ),
      body: Stack(
        children: [
          Stack(
            children: [
              SizedBox(
                child: CarouselSlider.builder(
                  itemCount: place!.photos!.length,
                  itemBuilder: (context, index, pageIndex) =>
                      CachedNetworkImage(
                    imageUrl: place?.photos![index] ?? '',
                    fit: BoxFit.cover,
                  ),
                  options: CarouselOptions(
                    padEnds: false,
                    viewportFraction: 1,
                    height: size.height * .8,
                    onPageChanged: (index, reason) =>
                        carousel_index.value = index,
                  ),
                ),
              ),
              Positioned(
                bottom: 100,
                left: 0,
                right: 0,
                height: 8,
                child: Center(
                  child: ListView.separated(
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      return AnimatedContainer(
                        width: carousel_index.value == index ? 30 : 8,
                        decoration: BoxDecoration(
                          color: carousel_index.value == index
                              ? Colors.white
                              : Colors.white54,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        duration: const Duration(
                          milliseconds: 240,
                        ),
                      );
                    },
                    separatorBuilder: (context, index) =>
                        const SizedBox(width: 5),
                    itemCount: place.photos?.length ?? 0,
                  ),
                ),
              ),
            ],
          ),
          Positioned(
            left: 20,
            top: 20,
            child: Container(
              height: 50,
              width: 50,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
                boxShadow: [
                  BoxShadow(
                    blurRadius: 35,
                    color: KPrimaryColor.shade800.withOpacity(0.2),
                    offset: const Offset(0, 2),
                  ),
                ],
              ),
              child: IconButton(
                icon: const Icon(
                  BoxIcons.bx_chevron_left,
                  size: 30,
                ),
                onPressed: () {
                  context.pop();
                },
              ),
            ),
          ),
          SizedBox.expand(
            child: DraggableScrollableSheet(
                initialChildSize: 0.2,
                minChildSize: 0.2,
                maxChildSize: 0.8,
                builder: (context, scrollController) {
                  return Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 30,
                      vertical: 20,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: const BorderRadius.vertical(
                        top: Radius.circular(30),
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.2),
                          offset: const Offset(0, -2),
                          blurRadius: 20,
                        )
                      ],
                    ),
                    child: SingleChildScrollView(
                      controller: scrollController,
                      child: Column(
                        children: [
                          Container(
                            height: 8,
                            width: size.width * .2,
                            decoration: BoxDecoration(
                              color: Colors.grey.shade200,
                              borderRadius: BorderRadius.circular(40),
                            ),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Row(
                            children: [
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    AutoSizeText(
                                      place.title ?? '',
                                      // overflow: TextOverflow.clip,
                                      maxLines: 1,
                                      style: const TextStyle(
                                        color: KPrimaryColor.shade900,
                                        fontSize: 36,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    Text(
                                      'distance_from_aa',
                                      style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.grey.shade700,
                                      ),
                                    ).tr(namedArgs: {
                                      "distance": '${place?.distance}'
                                    }),
                                  ],
                                ),
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              Material(
                                child: InkWell(
                                  borderRadius: BorderRadius.circular(20),
                                  onTap: () {
                                    context.push('/home/place-details/reviews');
                                  },
                                  child: Ink(
                                    padding: const EdgeInsets.all(8),
                                    child: Column(
                                      children: [
                                        Row(
                                          children: [
                                            const Icon(
                                              Bootstrap.star_fill,
                                              size: 30,
                                              color: KPrimaryColor.shade800,
                                            ),
                                            const SizedBox(
                                              width: 14,
                                            ),
                                            Text(
                                              '${place?.rating}',
                                              style: const TextStyle(
                                                fontSize: 36,
                                                fontWeight: FontWeight.bold,
                                                color: KPrimaryColor.shade800,
                                              ),
                                            ),
                                          ],
                                        ),
                                        const Text(
                                          'total_reviews',
                                          style: TextStyle(
                                            fontSize: 16,
                                            color: KPrimaryColor.shade500,
                                          ),
                                        ).tr(),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Row(
                            children: [
                              FilledButton.tonalIcon(
                                style: const ButtonStyle(
                                  iconColor: MaterialStatePropertyAll(
                                      KPrimaryColor.shade400),
                                ),
                                onPressed: () {
                                  context.push('/home/place-details/map');
                                },
                                icon: const Icon(Iconsax.map_1),
                                label: const Text(
                                  'show_map',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: KPrimaryColor.shade400,
                                  ),
                                ).tr(),
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              FilledButton.tonalIcon(
                                style: const ButtonStyle(
                                  iconColor: MaterialStatePropertyAll(
                                    KPrimaryColor.shade400,
                                  ),
                                ),
                                onPressed: () {},
                                icon: const Icon(Iconsax.cloud_snow),
                                label: const Text(
                                  'weather',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: KPrimaryColor.shade400,
                                  ),
                                ).tr(),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Text(
                            desc.content ?? '',
                            style: TextStyle(
                              fontSize: 18,
                              height: 1.7,
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                }),
          )
        ],
      ),
    );
  }
}
