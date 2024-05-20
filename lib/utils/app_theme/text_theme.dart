import 'package:flutter/material.dart';

class AppTextTheme {
  static const titleFontFamily = 'TitleFont';
  static const secondaryTextColor = Colors.white;
  static const primaryTextColor = Colors.black;

  static TextTheme get lightTextTheme => const TextTheme(
    headlineLarge: TextStyle(fontFamily: titleFontFamily),
        bodyLarge: TextStyle(),
        bodyMedium: TextStyle(),
        bodySmall: TextStyle(),
      );

  static TextTheme get darkTextTheme => const TextTheme(
    headlineLarge: TextStyle(fontFamily: titleFontFamily),
        bodyLarge: TextStyle(),
        bodyMedium: TextStyle(),
        bodySmall: TextStyle(),
      );
  
}
