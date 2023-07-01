import 'package:discover_ethiopia/components/BottomNavBar.dart';
import 'package:discover_ethiopia/screens/category.dart';
import 'package:discover_ethiopia/screens/home.dart';
import 'package:discover_ethiopia/screens/intro.dart';
import 'package:discover_ethiopia/screens/tools.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

final router = GoRouter(
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const IntroPage(),
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
          path: '/events',
          builder: (context, state) => const EventsPage(),
        ),
        GoRoute(
          path: '/category/:id',
          builder: (context, state) => CategoryPage(
            id: int.parse(state.queryParameters['id']!),
          ),
        )
      ],
    ),
  ],
);
