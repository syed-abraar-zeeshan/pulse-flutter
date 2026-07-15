import 'package:flutter/material.dart';

import 'app_colors.dart';
import 'app_text_styles.dart';

class LightTheme {
  LightTheme._();

  static ThemeData theme = ThemeData(
    useMaterial3: true,

    brightness: Brightness.light,

    primaryColor: AppColors.primary,

    scaffoldBackgroundColor: AppColors.lightBackground,

    colorScheme: const ColorScheme.light(
      primary: AppColors.primary,
      secondary: AppColors.secondary,
      error: AppColors.error,
      surface: AppColors.lightSurface,
    ),

    appBarTheme: AppBarTheme(
      backgroundColor: AppColors.lightSurface,
      foregroundColor: AppColors.lightTextPrimary,
      centerTitle: true,
      elevation: 0,
      titleTextStyle: AppTextStyles.titleLarge.copyWith(
        color: AppColors.lightTextPrimary,
      ),
    ),

    cardTheme: CardThemeData(
      color: AppColors.lightCard,
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
    ),

    dividerTheme: const DividerThemeData(
      color: AppColors.lightDivider,
      thickness: 1,
    ),

    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.primary,
        foregroundColor: AppColors.white,
        minimumSize: const Size(double.infinity, 52),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(14),
        ),
      ),
    ),

    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: AppColors.inputFillLight,

      hintStyle: AppTextStyles.bodyMedium.copyWith(
        color: AppColors.lightTextHint,
      ),

      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(14),
        borderSide: const BorderSide(
          color: AppColors.inputBorderLight,
        ),
      ),

      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(14),
        borderSide: const BorderSide(
          color: AppColors.inputBorderLight,
        ),
      ),

      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(14),
        borderSide: const BorderSide(
          color: AppColors.primary,
          width: 2,
        ),
      ),
    ),

    textTheme: TextTheme(
      displayLarge: AppTextStyles.displayLarge.copyWith(
        color: AppColors.lightTextPrimary,
      ),

      headlineLarge: AppTextStyles.headlineLarge.copyWith(
        color: AppColors.lightTextPrimary,
      ),

      headlineMedium: AppTextStyles.headlineMedium.copyWith(
        color: AppColors.lightTextPrimary,
      ),

      titleLarge: AppTextStyles.titleLarge.copyWith(
        color: AppColors.lightTextPrimary,
      ),

      bodyLarge: AppTextStyles.bodyLarge.copyWith(
        color: AppColors.lightTextPrimary,
      ),

      bodyMedium: AppTextStyles.bodyMedium.copyWith(
        color: AppColors.lightTextSecondary,
      ),

      bodySmall: AppTextStyles.bodySmall.copyWith(
        color: AppColors.lightTextHint,
      ),
    ),
  );
}