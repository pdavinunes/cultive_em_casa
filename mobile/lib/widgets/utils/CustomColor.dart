import 'package:flutter/material.dart';

final ThemeData CompanyThemeData = new ThemeData(
  brightness: Brightness.light,
  primaryColorBrightness: Brightness.light,
  accentColor: CompanyColors.green[500],
  accentColorBrightness: Brightness.light
);

class CompanyColors {
  CompanyColors._(); // this basically makes it so you can instantiate this class

 static const _greenPrimaryValue = 0xFF2E965B;

  static const MaterialColor green = const MaterialColor(
    _greenPrimaryValue,
    const <int, Color>{
      50:  const Color(0xFF2E965B),
      100: const Color(0xFF2E965B),
      200: const Color(0xFF2E965B),
      300: const Color(0xFF2E965B),
      400: const Color(0xFF2E965B),
      500: const Color(_greenPrimaryValue),
      600: const Color(0xFF2E965B),
      700: const Color(0xFF2E965B),
      800: const Color(0xFF2E965B),
      900: const Color(0xFF2E965B),
    },
  );
}