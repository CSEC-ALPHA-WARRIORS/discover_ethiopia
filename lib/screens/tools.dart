import 'package:cached_network_image/cached_network_image.dart';
import 'package:discover_ethiopia/constants/colors.dart';
import 'package:discover_ethiopia/state/auth_state.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:icons_plus/icons_plus.dart';

class ToolsPage extends HookConsumerWidget {
  const ToolsPage({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var authState = ref.watch(authStateProvider);
    return Scaffold(
      body: SafeArea(
        child: CustomScrollView(
          slivers: <Widget>[
            SliverToBoxAdapter(
              child: navbar(authState),
            ),
            const SliverToBoxAdapter(
              child: SizedBox(height: 20),
            ),
            SliverPadding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              sliver: SliverGrid.count(
                childAspectRatio: .7,
                mainAxisSpacing: 20,
                crossAxisCount: 2,
                crossAxisSpacing: 20,
                children: [
                  tools_card(
                    context,
                    "Ethiopian Calendar",
                    Bootstrap.calendar2_date,
                    '/calendar',
                  ),
                  tools_card(
                    context,
                    "Calendar Converter",
                    Bootstrap.arrow_repeat,
                    '/tools/calendar-converter',
                  ),
                  tools_card(
                    context,
                    "Weather\nForecast",
                    Bootstrap.cloud_sun,
                    '/weather',
                  ),
                  tools_card(
                    context,
                    "Currency\nConverter",
                    Bootstrap.currency_exchange,
                    '/tools/currency',
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Container navbar(AuthState authState) {
    return Container(
      // height: 80,
      // color: Colors.white,
      padding: const EdgeInsets.symmetric(
        horizontal: 20,
        vertical: 20,
      ),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "Tools",
                  style: TextStyle(
                    color: KPrimaryColor.shade700,
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ).tr(),
                const Text(
                  "Need Some tools, here they are",
                  style: TextStyle(
                    color: KPrimaryColor.shade900,
                    fontSize: 16,
                  ),
                ).tr(),
              ],
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
              imageUrl: authState.user?.photoURL ??
                  'https://api.dicebear.com/6.x/avataaars-neutral/svg?seed=Oreo',
              height: 50,
              width: 50,
              fit: BoxFit.cover,
            ),
          ),
        ],
      ),
    );
  }

  InkWell tools_card(
      BuildContext context, String label, IconData icon, String path) {
    return InkWell(
      borderRadius: BorderRadius.circular(20),
      splashColor: KPrimaryColor.shade100.withOpacity(0.2),
      onTap: () {
        context.push(path);
      },
      child: Ink(
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: KPrimaryColor.shade100.withOpacity(0.1),
          borderRadius: BorderRadius.circular(20),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Icon(
              icon,
              size: 90,
              color: KPrimaryColor.shade500,
            ),
            const SizedBox(
              height: 20,
            ),
            Text(
              label,
              style: const TextStyle(
                fontSize: 20,
                color: KPrimaryColor.shade500,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
