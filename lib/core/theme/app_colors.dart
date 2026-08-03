import 'package:flutter/material.dart';

class AppColors {
  AppColors._();

  // =========================
  // Brand Colors
  // =========================

  static const primary = Color(0xFF6366F1);
  static const primaryLight = Color(0xFF818CF8);
  static const primaryDark = Color(0xFF4F46E5);

  static const secondary = Color(0xFF06B6D4);

  // =========================
  // Common Colors
  // =========================

  static const white = Color(0xFFFFFFFF);
  static const black = Color(0xFF000000);

  static const transparent = Colors.transparent;

  // =========================
  // Status Colors
  // =========================

  static const success = Color(0xFF22C55E);
  static const warning = Color(0xFFF59E0B);
  static const error = Color(0xFFEF4444);
  static const info = Color(0xFF3B82F6);

  // =========================
  // Online / Offline
  // =========================

  static const online = Color(0xFF22C55E);
  static const offline = Color(0xFF94A3B8);

  // =========================
  // Light Theme
  // =========================

  static const lightBackground = Color(0xFFF8FAFC);

  static const lightSurface = Color(0xFFFFFFFF);

  static const lightCard = Color(0xFFFFFFFF);

  static const lightDivider = Color(0xFFE2E8F0);

  static const lightBorder = Color(0xFFCBD5E1);

  static const lightShadow = Color(0x1A000000);

  // Text

  static const lightTextPrimary = Color(0xFF0F172A);

  static const lightTextSecondary = Color(0xFF64748B);

  static const lightTextHint = Color(0xFF94A3B8);

  // =========================
  // Dark Theme
  // =========================

  static const darkBackground = Color(0xFF0F172A);

  static const darkSurface = Color(0xFF1E293B);

  static const darkCard = Color(0xFF1E293B);

  static const darkDivider = Color(0xFF334155);

  static const darkBorder = Color(0xFF475569);

  static const darkShadow = Color(0x66000000);

  // Text

  static const darkTextPrimary = Color(0xFFF8FAFC);

  static const darkTextSecondary = Color(0xFFCBD5E1);

  static const darkTextHint = Color(0xFF94A3B8);

  // =========================
  // Chat
  // =========================

  static const sentMessage = primary;

  static const receivedMessageLight = Color(0xFFF1F5F9);

  static const receivedMessageDark = Color(0xFF334155);

  // =========================
  // Input Fields
  // =========================

  static const inputFillLight = Color(0xFFFFFFFF);

  static const inputFillDark = Color(0xFF1E293B);

  static const inputBorderLight = Color(0xFFCBD5E1);

  static const inputBorderDark = Color(0xFF475569);

  // =========================
  // Buttons
  // =========================

  static const buttonDisabled = Color(0xFF94A3B8);

  // =========================
  // Skeleton / Loading
  // =========================

  static const shimmerBase = Color(0xFFE2E8F0);

  static const shimmerHighlight = Color(0xFFF8FAFC);

  static Color textPrimary(BuildContext context) {
    return Theme.of(context).brightness == Brightness.dark
        ? darkTextPrimary
        : lightTextPrimary;
  }

  static Color textSecondary(BuildContext context) {
    return Theme.of(context).brightness == Brightness.dark
        ? darkTextSecondary
        : lightTextSecondary;
  }

  static Color hint(BuildContext context) {
    return Theme.of(context).brightness == Brightness.dark
        ? darkTextHint
        : lightTextHint;
  }

  static Color divider(BuildContext context) {
    return Theme.of(context).brightness == Brightness.dark
        ? darkDivider
        : lightDivider;
  }

  static Color card(BuildContext context) {
    return Theme.of(context).brightness == Brightness.dark
        ? darkCard
        : lightCard;
  }

  static Color border(BuildContext context) {
    return Theme.of(context).brightness == Brightness.dark
        ? darkBorder
        : lightBorder;
  }

  static Color navigationBar(BuildContext context) {
    return Theme.of(context).brightness == Brightness.dark
        ? darkSurface
        : lightSurface;
  }

  static Color skeletonBase(BuildContext context) {
    return Theme.of(context).brightness == Brightness.dark
        ? darkDivider
        : shimmerBase;
  }

  static Color skeletonHighlight(BuildContext context) {
    return Theme.of(context).brightness == Brightness.dark
        ? darkBorder
        : shimmerHighlight;
  }
}
