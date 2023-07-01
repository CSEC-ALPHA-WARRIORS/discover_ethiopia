import 'package:discover_ethiopia/constants/colors.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:icons_plus/icons_plus.dart';

class BottomNavItem {
  final String path;
  final IconsaxData icon;
  final bool primary;

  const BottomNavItem({
    required this.path,
    required this.icon,
    this.primary = false,
  });
}

class BottomNavBar extends StatelessWidget {
  const BottomNavBar({
    super.key,
  });

  final List<BottomNavItem> _items = const [
    BottomNavItem(
      path: '/home',
      icon: Iconsax.home,
    ),
    BottomNavItem(
      path: '/events',
      icon: Iconsax.calendar,
    ),
    BottomNavItem(
      path: '/ethiopia',
      icon: Iconsax.heart,
      primary: true,
    ),
    BottomNavItem(
      path: '/tools',
      icon: Iconsax.box,
    ),
    BottomNavItem(
      path: '/settings',
      icon: Iconsax.setting,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    var location = GoRouter.of(context).location;
    return Container(
      // padding: const EdgeInsets.symmetric(horizontal: 20),
      height: 70,
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            blurRadius: 20,
            color: KPrimaryColor.shade100.withOpacity(0.4),
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: _items.map(
          (item) {
            if (item.primary) {
              return Expanded(
                child: Center(
                  child: GestureDetector(
                    onTap: () {
                      context.setLocale(context.locale.toString() == 'en'
                          ? const Locale('am')
                          : const Locale('en'));
                    },
                    child: Container(
                      height: 55,
                      width: 55,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(40),
                        gradient: const LinearGradient(
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                          colors: [
                            Color(0xFF925B3A),
                            Color(0xFF4F2410),
                          ],
                          stops: [0.0, 1.0],
                        ),
                        boxShadow: [
                          BoxShadow(
                            blurRadius: 6,
                            color: KPrimaryColor.shade50.withOpacity(0.5),
                            offset: const Offset(0, 5),
                          ),
                        ],
                      ),
                      child: Icon(
                        item.icon,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              );
            }

            return Expanded(
              child: Center(
                child: InkWell(
                  onTap: () {
                    context.go(item.path);
                  },
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        item.icon,
                        color: location == item.path
                            ? KPrimaryColor.shade500
                            : KPrimaryColor.shade600.withOpacity(0.7),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      AnimatedContainer(
                        duration: const Duration(microseconds: 200),
                        width: location == item.path ? 5 : 0,
                        height: location == item.path ? 5 : 0,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
                          color: KPrimaryColor.shade500,
                          boxShadow: [
                            BoxShadow(
                              color: KPrimaryColor.shade200.withOpacity(0.9),
                              blurRadius: 4,
                              offset: const Offset(0, 1),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        ).toList(),
      ),
    );
  }
}
