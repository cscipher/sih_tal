import 'package:flutter/material.dart';
import 'package:sih_tal/theme/colorPalette.dart';

class CustomTheme {
  static ThemeData get appTheme {
    return ThemeData(
        iconTheme: IconThemeData(color: textColor),
        textTheme: TextTheme(
          headline1: TextStyle(color: textColor),
          headline2: TextStyle(color: textColor),
          bodyText1: TextStyle(color: textColor),
          bodyText2: TextStyle(color: textColor),
        ),
        appBarTheme: AppBarTheme(
          color: primaryColor,
          textTheme: TextTheme(
            headline1: TextStyle(color: Colors.white),
          ),
        ),
        primaryColor: primaryColor,
        backgroundColor: secondaryColor,
        scaffoldBackgroundColor: secondaryColor);
  }
}
