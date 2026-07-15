import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'theme_storage.dart';

final themeProvider =
    AsyncNotifierProvider<ThemeNotifier, ThemeMode>(
  ThemeNotifier.new,
);

class ThemeNotifier extends AsyncNotifier<ThemeMode> {
  @override
  Future<ThemeMode> build() async {
    return ThemeStorage.getTheme();
  }

  Future<void> setTheme(
    ThemeMode themeMode,
  ) async {
    state = AsyncData(themeMode);

    await ThemeStorage.saveTheme(
      themeMode,
    );
  }
}