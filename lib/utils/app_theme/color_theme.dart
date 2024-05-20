import 'package:flutter/material.dart';

class AppColorTheme {
  static const primaryColor = Colors.blue;
  static const secondaryColor = Colors.white;
  static const tertiaryColor = Colors.orange;
  static ColorScheme get lightColorScheme => ColorScheme.fromSeed(
        seedColor: primaryColor,
        primary: primaryColor,
        secondary: secondaryColor,
        tertiary: tertiaryColor,
      );
  static ColorScheme get darkColorScheme => ColorScheme.fromSeed(
        seedColor: primaryColor,
        primary: primaryColor,
        secondary: secondaryColor,
        tertiary: tertiaryColor,
      );
}
