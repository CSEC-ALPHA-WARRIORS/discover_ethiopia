import 'package:cached_network_image/cached_network_image.dart';
import 'package:discover_ethiopia/constants/colors.dart';
import 'package:discover_ethiopia/controllers/categories/categories_controller.dart';
import 'package:discover_ethiopia/controllers/places/place_controller.dart';
import 'package:discover_ethiopia/models/category/category.dart';
import 'package:discover_ethiopia/screens/components/PopularPlaceItem.dart';
import 'package:discover_ethiopia/state/auth_state.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:fade_shimmer/fade_shimmer.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:icons_plus/icons_plus.dart';

import 'components/CategoryCard.dart';
import 'components/ErrorAlert.dart';

class DiscoverAppHome extends HookConsumerWidget {
  const DiscoverAppHome({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var authState = ref.watch(authStateProvider);
    var categories = ref.watch(categoriesProvider);
    var popularPlaces = ref.watch(popularPlacesProvider);
    var size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 0,
        systemOverlayStyle: const SystemUiOverlayStyle(
          statusBarColor: KPrimaryColor.shade700,
          statusBarBrightness: Brightness.light,
          statusBarIconBrightness: Brightness.light,
        ),
      ),
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: Container(
                height: 180,
                margin: const EdgeInsets.only(bottom: 20),
                child: Stack(
                  alignment: Alignment.topCenter,
                  children: [
                    Positioned.fill(
                      bottom: 30,
                      child: Container(
                        decoration: const BoxDecoration(
                          color: KPrimaryColor.shade700,
                          borderRadius: BorderRadius.vertical(
                            bottom: Radius.circular(20),
                          ),
                        ),
                      ),
                    ),
                    header(authState),
                    Positioned(
                      bottom: 0,
                      child: searchBox(context, size),
                    ),
                  ],
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: categorySection(size, categories, ref),
            ),
            SliverToBoxAdapter(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 40,
                  ),
                  sectionTitle("popular_places".tr()),
                  const SizedBox(
                    height: 15,
                  ),
                  popularPlaces.when(
                    data: (data) => Container(
                      height: 420,
                      clipBehavior: Clip.none,
                      child: ListView.separated(
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) {
                          var place = data[index];
                          return Container(
                            margin: EdgeInsets.only(
                              left: index == 0 ? 20 : 0,
                              right: index == data.length - 1 ? 20 : 0,
                            ),
                            child: PopularPlaceItem(
                              place: place,
                            ),
                          );
                        },
                        separatorBuilder: (context, index) => const SizedBox(
                          width: 30,
                        ),
                        itemCount: data.length,
                      ),
                    ),
                    error: (error, stackTrace) => SizedBox(
                      width: size.width,
                      child: ErrorAlert(
                          title: 'err',
                          desc: 'load_popular_place_fail',
                          onRetry: () => ref.refresh(popularPlacesProvider)),
                    ),
                    loading: () => SizedBox(
                      height: 300,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) => Padding(
                          padding: const EdgeInsets.only(left: 20.0),
                          child: FadeShimmer(
                            width: size.width * .8,
                            height: 400,
                            radius: 10,
                            fadeTheme: FadeTheme.light,
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 0,
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Column categorySection(
      Size size, AsyncValue<List<Category>> categories, WidgetRef ref) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(
          height: 20,
        ),
        sectionTitle("categories".tr()),
        const SizedBox(
          height: 10,
        ),
        SizedBox(
          width: size.width,
          height: 200,
          child: categories.when(
            data: (data) {
              return ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: data.length,
                itemBuilder: (context, index) {
                  var current = data[index];
                  return CategoryCard(category: current);
                },
              );
            },
            error: (error, stackTrace) => ErrorAlert(
                title: 'err',
                desc: 'load_cat_fail',
                onRetry: () {
                  ref.invalidate(categoriesProvider);
                }),
            loading: () => ListView.builder(
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) => const Padding(
                padding: EdgeInsets.only(left: 20.0),
                child: FadeShimmer(
                  width: 140,
                  radius: 10,
                  height: 200,
                  fadeTheme: FadeTheme.light,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  Padding sectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Text(
        title,
        style: TextStyle(
          color: Colors.grey.shade900,
          fontSize: 24,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  Container searchBox(BuildContext context, Size size) {
    return Container(
      width: size.width,
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: Container(
        padding: const EdgeInsets.only(
          left: 15,
          top: 8,
          bottom: 8,
        ),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              color: KPrimaryColor.shade800.withOpacity(.3),
              blurRadius: 33,
              offset: const Offset(0, 3),
            ),
          ],
        ),
        child: Row(
          children: [
            Expanded(
              child: TextField(
                decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: "search_attractions".tr(),
                ),
                style: const TextStyle(
                  fontSize: 18,
                  color: KPrimaryColor.shade900,
                ),
              ),
            ),
            IconButton(
              onPressed: () {
                context.setLocale(context.locale.toString() == 'en'
                    ? const Locale('am')
                    : const Locale('en'));
              },
              icon: const Icon(BoxIcons.bx_search_alt),
              color: KPrimaryColor.shade900,
            )
          ],
        ),
      ),
    );
  }

  Container header(AuthState authState) {
    return Container(
      padding: const EdgeInsets.all(30),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 60,
            width: 60,
            clipBehavior: Clip.antiAlias,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.1),
                  blurRadius: 40,
                )
              ],
            ),
            child: authState.user == null
                ? Image.asset('assets/images/dummy-profile.jpg')
                : CachedNetworkImage(imageUrl: authState.user!.photoURL ?? ""),
          ),
          const SizedBox(
            width: 20,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const Text(
                "hello",
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ).tr(namedArgs: {"name": "Naol"}),
              const Text(
                "explore",
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.white,
                ),
              ).tr(),
            ],
          ),
        ],
      ),
    );
  }
}
