import 'package:flutter/material.dart';

class LanguageClass {
  final Locale locale;
  final String label;

  LanguageClass({
    required this.locale,
    required this.label,
  });
}

List<LanguageClass> langs = [
  LanguageClass(locale: const Locale('en'), label: "English"),
  LanguageClass(locale: const Locale('am'), label: "Amharic"),
];
