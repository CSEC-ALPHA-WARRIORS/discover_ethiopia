import 'package:discover_ethiopia/constants/colors.dart';
import 'package:discover_ethiopia/firebase_options.dart';
import 'package:discover_ethiopia/screens/home.dart';
import 'package:discover_ethiopia/screens/intro.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Discover Ethiopia',
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(seedColor: KPrimaryColor.shade500),
      ).copyWith(
        textTheme: GoogleFonts.sourceSans3TextTheme(),
      ),
      home: const DiscoverAppHome(),
    );
  }
}
