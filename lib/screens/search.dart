import 'package:cached_network_image/cached_network_image.dart';
import 'package:discover_ethiopia/constants/colors.dart';
import 'package:discover_ethiopia/controllers/places/place_controller.dart';
import 'package:discover_ethiopia/screens/components/ErrorAlert.dart';
import 'package:discover_ethiopia/screens/components/PlaceListItem.dart';
import 'package:discover_ethiopia/state/auth_state.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:icons_plus/icons_plus.dart';

class SearchPage extends HookConsumerWidget {
  const SearchPage({super.key, required this.keyword});
  final String keyword;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var authState = ref.watch(authStateProvider);
    var searchController = useTextEditingController(text: keyword);
    var searchValue = useState(keyword);
    var searchResults =
        ref.watch(searchPlaceProvider(keyword: searchValue.value));

    return Scaffold(
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: SizedBox(
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
                        height: 40,
                        width: 40,
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
                            size: 25,
                          ),
                          color: KPrimaryColor.shade900,
                        ),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Expanded(
                        child: Container(
                          padding: const EdgeInsets.only(left: 10),
                          decoration: BoxDecoration(
                            color: Colors.grey.shade100,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Row(
                            children: [
                              Expanded(
                                child: TextField(
                                  controller: searchController,
                                  decoration: InputDecoration(
                                    border: InputBorder.none,
                                    hintText: "search_attractions".tr(),
                                  ),
                                ),
                              ),
                              IconButton(
                                icon: const Icon(BoxIcons.bx_search_alt),
                                onPressed: () {
                                  searchValue.value = searchController.text;
                                },
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            searchResults.when(
              data: (data) {
                if (data.isEmpty) {
                  return const SliverToBoxAdapter(
                    child: ErrorAlert(
                      title: "no_result",
                      desc: "no_result_desc",
                    ),
                  );
                }
                return SliverList.separated(
                  separatorBuilder: (context, index) => const SizedBox(
                    height: 20,
                  ),
                  itemCount: data.length,
                  itemBuilder: (context, index) {
                    var place = data[index];
                    return PlaceListItem(place: place);
                  },
                );
              },
              error: (error, stackTrace) {
                return SliverToBoxAdapter(
                  child: ErrorAlert(
                      title: "err",
                      desc: "load_search_fail",
                      onRetry: () {
                        ref.invalidate(searchPlaceProvider);
                      }),
                );
              },
              loading: () {
                return SliverList.separated(
                  separatorBuilder: (context, index) => const SizedBox(
                    height: 20,
                  ),
                  itemBuilder: (context, index) {
                    return PlaceListItemLoader(index: index);
                  },
                );
              },
            )
          ],
        ),
      ),
    );
  }
}
