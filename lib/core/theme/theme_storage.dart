import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ThemeStorage {
  ThemeStorage._();

  static const _themeKey = 'theme_mode';

  static Future<void> saveTheme(
    ThemeMode themeMode,
  ) async {
    final prefs =
        await SharedPreferences.getInstance();

    await prefs.setString(
      _themeKey,
      themeMode.name,
    );
  }

  static Future<ThemeMode> getTheme() async {
    final prefs =
        await SharedPreferences.getInstance();

    final theme =
        prefs.getString(_themeKey);

    switch (theme) {
      case 'light':
        return ThemeMode.light;

      case 'dark':
        return ThemeMode.dark;

      default:
        return ThemeMode.system;
    }
  }
}