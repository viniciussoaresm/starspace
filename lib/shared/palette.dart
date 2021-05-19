import 'package:flutter/material.dart';

class Palette {
  static const Color primary = Color(0xff0B0C10);
  static const Color secondary = Color(0xffD1D5D8);
  static const Color intermediate = Color(0xff5E6B73);

  static final darkTheme = ThemeData(
      primarySwatch: Colors.grey,
      primaryColor: primary,
      brightness: Brightness.dark,
      backgroundColor: primary,
      accentColor: secondary,
      accentIconTheme: IconThemeData(color: primary),
      dividerColor: intermediate,
      primaryTextTheme: TextTheme(
          headline6:
              TextStyle(fontFamily: "Start Jedi", color: Palette.secondary)));

  static final lightTheme = ThemeData(
      primarySwatch: Colors.grey,
      primaryColor: intermediate,
      brightness: Brightness.light,
      backgroundColor: intermediate,
      accentColor: primary,
      accentIconTheme: IconThemeData(color: intermediate),
      dividerColor: primary,
      primaryTextTheme: TextTheme(
          headline6:
              TextStyle(fontFamily: "Start Jedi", color: Palette.secondary)));
}
