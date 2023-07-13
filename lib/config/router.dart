import 'package:discover_ethiopia/components/bottom_navbar.dart';
import 'package:discover_ethiopia/screens/calendar.dart';
import 'package:discover_ethiopia/screens/calendar_converter.dart';
import 'package:discover_ethiopia/screens/category.dart';
import 'package:discover_ethiopia/screens/currency_converter.dart';
import 'package:discover_ethiopia/screens/home.dart';
import 'package:discover_ethiopia/screens/intro.dart';
import 'package:discover_ethiopia/screens/place_details.dart';
import 'package:discover_ethiopia/screens/place_map.dart';
import 'package:discover_ethiopia/screens/profile.dart';
import 'package:discover_ethiopia/screens/reviews.dart';
import 'package:discover_ethiopia/screens/search.dart';
import 'package:discover_ethiopia/screens/tools.dart';
import 'package:discover_ethiopia/state/auth_state.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'router.g.dart';

@Riverpod(keepAlive: true)
GoRouter router(Ref ref) {
  final authState = ref.watch(authStateProvider);

  return GoRouter(
    routes: [
      GoRoute(
        path: '/',
        redirect: (context, state) {
          if (authState.user == null) {
            return '/intro';
          } else {
            return '/home';
          }
        },
      ),
      GoRoute(
        path: '/intro',
        builder: (context, state) => const IntroPage(),
        redirect: (context, state) {
          if (authState.user != null) {
            return '/home';
          }
          return null;
        },
      ),
      GoRoute(
        path: '/tools/currency',
        builder: (context, state) => CurrencyConverter(),
      ),
      ShellRoute(
        builder: (context, state, child) => Scaffold(
          body: child,
          bottomNavigationBar: const BottomNavBar(),
        ),
        routes: [
          GoRoute(
            path: '/home',
            builder: (context, state) => const DiscoverAppHome(),
          ),
          GoRoute(
            path: '/calendar',
            builder: (context, state) => const Calendar(),
          ),
          GoRoute(
            path: '/tools',
            builder: (context, state) => const ToolsPage(),
          ),
          GoRoute(
            path: '/tools/calendar-converter',
            builder: (context, state) => const CalendarConverter(),
          ),
          GoRoute(
            path: '/home/category/:id',
            builder: (context, state) => CategoryPage(
              id: int.parse(state.pathParameters['id']!),
            ),
          ),
          GoRoute(
            path: '/home/search',
            builder: (context, state) => SearchPage(
              keyword: state.queryParameters["keyword"] ?? "",
            ),
          ),
          GoRoute(
            path: '/home/place-details',
            builder: (context, state) => const PlaceDetailsPage(),
          ),
          GoRoute(
            path: '/home/place-details/map',
            builder: (context, state) => const PlaceMap(),
          ),
          GoRoute(
            path: '/home/place-details/reviews',
            builder: (context, state) => const ReviewPage(),
          ),
          GoRoute(
            path: '/settings',
            builder: (context, state) => const ProfilePage(),
          )
        ],
      ),
    ],
  );
}
