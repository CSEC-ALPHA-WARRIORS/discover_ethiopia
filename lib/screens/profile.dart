import 'package:cached_network_image/cached_network_image.dart';
import 'package:discover_ethiopia/constants/colors.dart';
import 'package:discover_ethiopia/state/auth_state.dart';
import 'package:discover_ethiopia/state/language/lang.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:icons_plus/icons_plus.dart';

class ProfilePage extends HookConsumerWidget {
  const ProfilePage({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var authState = ref.watch(authStateProvider);
    var size = MediaQuery.of(context).size;

    return Scaffold(
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: Column(
                children: [
                  SizedBox(
                    height: size.height * .35,
                    child: Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            height: 100,
                            width: 100,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(100),
                              boxShadow: [
                                const BoxShadow(
                                  spreadRadius: 6,
                                  color: KPrimaryColor.shade500,
                                ),
                                const BoxShadow(
                                  spreadRadius: 3,
                                  color: Colors.white,
                                ),
                                BoxShadow(
                                  blurRadius: 20,
                                  color:
                                      KPrimaryColor.shade400.withOpacity(0.5),
                                  offset: const Offset(0, 4),
                                ),
                              ],
                            ),
                            clipBehavior: Clip.antiAlias,
                            child: CachedNetworkImage(
                              imageUrl: authState.user?.photoURL ??
                                  'https://api.dicebear.com/6.x/adventurer/svg?seed=${authState.user?.displayName}',
                              fit: BoxFit.cover,
                            ),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Text(
                            authState.user?.displayName ?? "Guest",
                            style: const TextStyle(
                              fontSize: 36,
                              fontWeight: FontWeight.bold,
                              color: KPrimaryColor.shade900,
                            ),
                          ),
                          Text(
                            authState.user?.email ?? "Guest",
                            style: const TextStyle(
                              fontSize: 16,
                              color: KPrimaryColor.shade900,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  ListTile(
                    onTap: () {
                      showDialog(
                        context: context,
                        builder: (context) {
                          return SimpleDialog(
                            children: langs
                                .map((e) => SimpleDialogOption(
                                      onPressed: () {
                                        context.setLocale(e.locale);
                                        Navigator.pop(context);
                                      },
                                      child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Row(
                                          children: [
                                            const Icon(
                                              Iconsax.language_square,
                                              size: 30,
                                            ),
                                            const SizedBox(
                                              width: 10,
                                            ),
                                            Text(e.label).tr(),
                                          ],
                                        ),
                                      ),
                                    ))
                                .toList(),
                          );
                        },
                      );
                    },
                    title: const Text(
                      "change_lang",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: KPrimaryColor.shade800,
                      ),
                    ).tr(),
                    subtitle: const Text("change_lang_desc").tr(),
                    leading: const Icon(
                      Iconsax.language_circle,
                      size: 30,
                    ),
                    trailing: const Icon(
                      Iconsax.arrow_right_2,
                      size: 30,
                    ),
                  ),
                  const Divider(),
                  ListTile(
                    onTap: () {
                      ref.read(authStateProvider.notifier).logout();
                      context.go('/');
                    },
                    title: const Text(
                      "logout",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: KPrimaryColor.shade800,
                      ),
                    ).tr(),
                    subtitle: const Text("logout_desc").tr(),
                    leading: const Icon(
                      Iconsax.logout_1,
                      size: 30,
                    ),
                    trailing: const Icon(
                      Iconsax.arrow_right_2,
                      size: 30,
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
