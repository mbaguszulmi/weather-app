import 'package:flutter/material.dart';

final ThemeData appThemeLight = ThemeData(
  brightness: Brightness.light,
  primaryColor: AppColors.primaryColor,
  primaryColorLight: AppColors.primaryColor[300],
  primaryColorDark: AppColors.primaryColor[800],
  colorScheme: const ColorScheme.light().copyWith(
    primary: AppColors.primaryColor,
    primaryContainer: AppColors.primaryColor[300],
    secondary: AppColors.secondaryColor[500],
    onPrimary: Colors.white,
    onSecondary: AppColors.primaryColor,
  ),
  appBarTheme: const AppBarTheme(
    color: Colors.white,
    foregroundColor: AppColors.primaryColor,
    elevation: 0,
  ),
);

class AppColors {
  AppColors._();

  static const int _primaryColor = 0xFF002060;
  static const MaterialColor primaryColor = MaterialColor(_primaryColor, {
    50: Color(0xFF8090b0),
    100: Color(0xFF6679a0),
    200: Color(0xFF4d6390),
    300: Color(0xFF334d80),
    400: Color(0xFF1a3670),
    500: Color(_primaryColor),
    600: Color(0xFF001D56),
    700: Color(0xFF001a4d),
    800: Color(0xFF001643),
    900: Color(0xFF00133a),
  });

  static const int _secondaryColor = 0xFF00D9D5;

  static const MaterialColor secondaryColor = MaterialColor(0xFF00D9D5, {
    50: Color(0xFF006d6b),
    100: Color(0xFF008280),
    200: Color(0xFF009895),
    300: Color(0xFF00aeaa),
    400: Color(0xFF00c3c0),
    500: Color(_secondaryColor),
    600: Color(0xFF1addd9),
    700: Color(0xFF33e1dd),
    800: Color(0xFF4de4e2),
    900: Color(0xFF66e8e6),
  });

  static const int _greyValue = 0xFF767272;
  static const MaterialColor grey = MaterialColor(_greyValue, {
    50: Color(0xffebe4e4),
    100: Color(0xffd4cdcd),
    200: Color(0xffbcb6b6),
    300: Color(0xffa5a0a0),
    400: Color(0xff8d8989),
    500: Color(_greyValue),
    600: Color(0xff5e5b5b),
    700: Color(0xff464444),
    800: Color(0xff2f2e2e),
    900: Color(0xff171717),
  });

  static const disable = Color(0xffebe4e4);
  static const disable10 = Color(0x1Aebe4e4);
  static const disable20 = Color(0x33ebe4e4);
  static const disable30 = Color(0x4Debe4e4);
  static const disable40 = Color(0x66ebe4e4);
  static const disable50 = Color(0x80ebe4e4);
  static const disable60 = Color(0x99ebe4e4);
  static const disable70 = Color(0xB3ebe4e4);
  static const disable80 = Color(0xCCebe4e4);
  static const disable90 = Color(0xE6ebe4e4);
}
