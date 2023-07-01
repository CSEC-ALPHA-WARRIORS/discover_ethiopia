import 'package:discover_ethiopia/constants/colors.dart';
import 'package:discover_ethiopia/firebase_options.dart';
import 'package:discover_ethiopia/screens/home.dart';
import 'package:discover_ethiopia/screens/intro.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'config/router.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(
    EasyLocalization(
      supportedLocales: const [
        Locale('en'),
        Locale('am'),
      ],
      startLocale: const Locale('am'),
      path: 'assets/translations',
      child: const ProviderScope(
        child: MyApp(),
      ),
    ),
  );
}

class MyApp extends HookConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return MaterialApp.router(
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale,
      debugShowCheckedModeBanner: false,
      title: 'Discover Ethiopia',
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(seedColor: KPrimaryColor.shade500),
      ).copyWith(
        textTheme: context.locale.toString() == 'am'
            ? GoogleFonts.notoSerifEthiopicTextTheme()
            : GoogleFonts.sourceSans3TextTheme(),
      ),
      routerConfig: router,
    );
  }
}
