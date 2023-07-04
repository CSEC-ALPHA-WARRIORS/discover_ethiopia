import 'package:cached_network_image/cached_network_image.dart';
import 'package:discover_ethiopia/constants/colors.dart';
import 'package:discover_ethiopia/controllers/categories/categories_controller.dart';
import 'package:discover_ethiopia/controllers/places/place_controller.dart';
import 'package:discover_ethiopia/models/place/place.dart';
import 'package:discover_ethiopia/screens/components/ErrorAlert.dart';
import 'package:discover_ethiopia/screens/components/PlaceListItem.dart';
import 'package:discover_ethiopia/state/auth_state.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:fade_shimmer/fade_shimmer.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:icons_plus/icons_plus.dart';

class CategoryPage extends HookConsumerWidget {
  const CategoryPage({super.key, required this.id});
  final int id;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var authState = ref.watch(authStateProvider);
    var category = ref.watch(currentCategoryProvider);
    var categoryPlaces = ref.watch(categoryPlacesProvider);
    var size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 0,
        systemOverlayStyle: const SystemUiOverlayStyle(
          statusBarColor: Colors.white,
          statusBarBrightness: Brightness.dark,
          statusBarIconBrightness: Brightness.dark,
        ),
      ),
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: Container(
                // height: 80,
                // color: Colors.white,
                padding: const EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 20,
                ),
                child: Row(
                  children: [
                    Container(
                      height: 50,
                      width: 50,
                      decoration: BoxDecoration(
                        color: Colors.grey.shade200,
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child: IconButton(
                        onPressed: () {
                          context.pop();
                        },
                        icon: const Icon(
                          BoxIcons.bx_chevron_left,
                          size: 30,
                        ),
                        color: KPrimaryColor.shade900,
                      ),
                    ),
                    Expanded(
                      child: Center(
                        child: Text(
                          category?.name ?? '',
                          style: const TextStyle(
                            color: KPrimaryColor.shade700,
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ).tr(),
                      ),
                    ),
                    Container(
                      clipBehavior: Clip.antiAlias,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: [
                          BoxShadow(
                            blurRadius: 20,
                            color: KPrimaryColor.shade100.withOpacity(0.2),
                            offset: const Offset(0, 2),
                          )
                        ],
                      ),
                      child: CachedNetworkImage(
                        imageUrl: authState.user!.photoURL ?? '',
                        height: 50,
                        width: 50,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 10)
                        .copyWith(top: 20),
                child: Text(
                  category?.desc ?? '',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                    color: Colors.grey.shade600,
                    height: 1.6,
                  ),
                ),
              ),
            ),
            const SliverToBoxAdapter(
              child: SizedBox(height: 30),
            ),
            categoryPlaces.when(
              data: (data) => SliverList.separated(
                itemCount: data.length,
                separatorBuilder: (context, index) => const SizedBox(
                  height: 30,
                ),
                itemBuilder: (context, index) {
                  var place = data[index];
                  return PlaceListItem(place: place);
                },
              ),
              error: (error, stackTrace) => SliverToBoxAdapter(
                child: ErrorAlert(
                  title: "err",
                  desc: 'load_place_fail',
                  onRetry: () {
                    categoryPlaces = ref.refresh(categoryPlacesProvider);
                  },
                ),
              ),
              loading: () => SliverList.separated(
                itemBuilder: (context, index) =>
                    PlaceListItemLoader(index: index),
                separatorBuilder: (context, index) => const SizedBox(
                  height: 40,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
