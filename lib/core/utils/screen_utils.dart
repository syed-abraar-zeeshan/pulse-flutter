import 'package:flutter/material.dart';

class ScreenUtils {
  ScreenUtils._();
  static double width(BuildContext context) => MediaQuery.sizeOf(context).width;

  static double height(BuildContext context) =>
      MediaQuery.sizeOf(context).height;

  static bool isMobile(BuildContext context) {
    return width(context) < 600;
  }

  static bool isTablet(BuildContext context) {
    return width(context) >= 600 && width(context) < 1024;
  }

  static bool isDesktop(BuildContext context) {
    return width(context) >= 1024;
  }

  static bool isLandscape(BuildContext context) =>
      MediaQuery.orientationOf(context) == Orientation.landscape;

  static bool isPortrait(BuildContext context) =>
      MediaQuery.orientationOf(context) == Orientation.portrait;

  static EdgeInsets padding(BuildContext context) =>
      MediaQuery.paddingOf(context);
}
