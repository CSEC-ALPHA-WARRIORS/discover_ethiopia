import 'package:cached_network_image/cached_network_image.dart';
import 'package:discover_ethiopia/constants/colors.dart';
import 'package:discover_ethiopia/state/auth_state.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:icons_plus/icons_plus.dart';

class CustomAppBar extends HookConsumerWidget {
  const CustomAppBar({
    super.key,
    required this.title,
  });

  final String? title;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final authState = ref.watch(authStateProvider);
    return Container(
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
                title ?? '',
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
    );
  }
}
