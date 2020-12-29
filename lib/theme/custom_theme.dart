import 'package:flutter/material.dart';

class CustomTheme {
  static CustomTheme _instance;

  factory CustomTheme() => _instance ?? new CustomTheme._();

  CustomTheme._();

  static final Color color1 = Color.fromRGBO(11, 45, 119, 1);
  // static final Color color2 = Color.fromRGBO(196, 182, 37, 1);
  static final Color color2 = Color.fromRGBO(196, 113, 37, 1);
  static final Color color9 = Color.fromRGBO(42, 46, 67, 1);
  static final Color textColor = color1;
  static final Color loginContainerColor = Colors.grey[200];

  final ThemeData _themeData = ThemeData.light().copyWith(
    appBarTheme: AppBarTheme(
      iconTheme: IconThemeData(color: color1),
    ),
    primaryColor: color1,
    cursorColor: color1,
    buttonTheme: ButtonThemeData(textTheme: ButtonTextTheme.primary),
    textTheme: TextTheme(
      bodyText1: TextStyle(color: color1),
      bodyText2: TextStyle(color: color1),
      subtitle1: TextStyle(color: color1),
    ),
  );

  static final textLabelMainStyle = TextStyle(color: textColor, fontSize: 16);

  static final horizontalPadding = const EdgeInsets.symmetric(horizontal: 18);

  static final authBorder = BorderRadius.only(
    topLeft: Radius.circular(60),
  );

  ThemeData theme() => _themeData;
}
