import 'package:pulse_flutter/core/constants/app_strings.dart';

class Validators {
  Validators._();

  static String? validateName(String? value) {
    if (value == null || value.trim().isEmpty) {
      return AppStrings.enterFullName;
    }

    if (value.trim().length < 3) {
      return AppStrings.nameMinLength;
    }

    return null;
  }

  static String? validateUsername(String? value) {
    if (value == null || value.trim().isEmpty) {
      return AppStrings.enterUsername;
    }

    if (value.trim().length < 3) {
      return AppStrings.usernameMinLength;
    }

    return null;
  }

  static String? validateEmail(String? value) {
    if (value == null || value.trim().isEmpty) {
      return AppStrings.enterEmail;
    }

    final emailRegex = RegExp(r'^[\w-.]+@([\w-]+\.)+[\w-]{2,4}$');

    final email = value.trim();

    if (!emailRegex.hasMatch(email)) {
      return AppStrings.invalidEmail;
    }

    return null;
  }

  static String? validatePhone(String? value) {
    if (value == null || value.trim().isEmpty) {
      return AppStrings.enterPhone;
    }

    final phone = value.trim();

    if (phone.length != 10) {
      return AppStrings.invalidPhone;
    }
    final phoneRegex = RegExp(r'^\d{10}$');

    if (!phoneRegex.hasMatch(phone)) {
      return AppStrings.invalidPhone;
    }

    return null;
  }

  static String? validatePassword(String? value) {
    if (value == null || value.trim().isEmpty) {
      return AppStrings.enterPassword;
    }

    if (value.length < 8) {
      return AppStrings.passwordMinLength;
    }

    return null;
  }

  static String? validateConfirmPassword(String? value, String password) {
    if (value == null || value.trim().isEmpty) {
      return AppStrings.enterConfirmPassword;
    }

    if (value.trim() != password.trim()) {
      return AppStrings.passwordMismatch;
    }

    return null;
  }
}
