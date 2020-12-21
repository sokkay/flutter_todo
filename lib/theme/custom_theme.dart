import 'package:flutter/material.dart';

class CustomTheme {
  static CustomTheme _instance;

  factory CustomTheme() => _instance ?? new CustomTheme._();

  CustomTheme._();

  static const Color color1 = Color.fromRGBO(11, 45, 119, 1);
  static const Color textColor = color1;

  final ThemeData _themeData = ThemeData.light().copyWith(
    appBarTheme: AppBarTheme(
      iconTheme: IconThemeData(color: color1),
    ),
  );

  static const textLabelMainStyle =
      const TextStyle(color: textColor, fontSize: 16);

  static const horizontalPadding = const EdgeInsets.symmetric(horizontal: 18);

  ThemeData theme() => _themeData;
}
