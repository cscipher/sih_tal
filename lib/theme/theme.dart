import 'package:flutter/material.dart';
import 'package:sih_tal/theme/colorPalette.dart';

class CustomTheme {
  static ThemeData get appTheme {
    return ThemeData(
        iconTheme: IconThemeData(color: textColor),
        textTheme: TextTheme(
          headline1: TextStyle(color: textColor),
          headline2: TextStyle(color: subTextColor),
          bodyText1: TextStyle(color: textColor),
          bodyText2: TextStyle(color: subTextColor),
        ),
        primaryColor: primaryColor,
        backgroundColor: secondaryColor,
        scaffoldBackgroundColor: secondaryColor);
  }
}
