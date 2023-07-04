import 'package:auto_size_text/auto_size_text.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:discover_ethiopia/constants/colors.dart';
import 'package:discover_ethiopia/controllers/places/place_controller.dart';
import 'package:discover_ethiopia/controllers/weather/weather_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:go_router/go_router.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:icons_plus/icons_plus.dart';

class PlaceMap extends HookConsumerWidget {
  const PlaceMap({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var place = ref.watch(currentPlaceProvider);
    var size = MediaQuery.of(context).size;
    var weather = ref.watch(
      CurrentWeatherProvider(
        lat: place?.latitude ?? 0,
        lon: place?.longitude ?? 0,
      ),
    );

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
                child: GoogleMap(
                  mapType: MapType.hybrid,
                  buildingsEnabled: true,
                  mapToolbarEnabled: true,
                  compassEnabled: true,
                  initialCameraPosition: CameraPosition(
                    target: LatLng(place?.latitude ?? 0, place?.longitude ?? 0),
                    zoom: 15,
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
                maxChildSize: 0.2,
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
                            height: 16,
                          ),
                          Row(
                            children: [
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    AutoSizeText(
                                      place?.title ?? '',
                                      // overflow: TextOverflow.clip,
                                      maxLines: 1,
                                      style: const TextStyle(
                                        color: KPrimaryColor.shade900,
                                        fontSize: 36,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    Text(
                                      '${place?.latitude}, ${place?.longitude}',
                                      style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.grey.shade700,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              Container(
                                padding: const EdgeInsets.all(8),
                                child: weather.when(
                                  data: (data) => Column(
                                    children: [
                                      CachedNetworkImage(
                                        imageUrl: weatherIconUrl(
                                          data["weather"][0]["icon"],
                                        ),
                                        height: 50,
                                        width: 70,
                                        fit: BoxFit.fitWidth,
                                      ),
                                      Text(
                                        "${data["main"]["temp"].round()} °C",
                                        style: const TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 24,
                                        ),
                                      ),
                                    ],
                                  ),
                                  error: (error, stackTrace) {
                                    return Material(
                                      child: InkWell(
                                        borderRadius: BorderRadius.circular(10),
                                        onTap: () {
                                          ref.invalidate(
                                              currentWeatherProvider);
                                        },
                                        child: Ink(
                                          padding: const EdgeInsets.symmetric(
                                            horizontal: 10,
                                            vertical: 10,
                                          ),
                                          decoration: const BoxDecoration(),
                                          child: const Column(
                                            children: [
                                              Icon(
                                                Iconsax.cloud_cross,
                                                size: 30,
                                              ),
                                              Text('Tap to try again'),
                                            ],
                                          ),
                                        ),
                                      ),
                                    );
                                  },
                                  loading: () => const Center(
                                    child: CircularProgressIndicator(
                                      strokeWidth: 2,
                                    ),
                                  ),
                                ),
                              ),
                            ],
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
