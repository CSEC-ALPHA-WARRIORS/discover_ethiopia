import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'lang.g.dart';

@riverpod
class Language extends _$Language {
  @override
  Locale build() {
    return const Locale('en');
  }

  void changeLocale(Locale l) {
    state = l;
  }
}
