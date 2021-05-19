import 'package:flutter/material.dart';
import 'package:starspace/shared/palette.dart';

enum ThemeEnum { LIGHT, DARK }

extension ThemeEnumExt on ThemeEnum {
  ThemeData get theme {
    switch (this) {
      case ThemeEnum.LIGHT:
        return Palette.lightTheme;
      case ThemeEnum.DARK:
        return Palette.darkTheme;
    }
  }

  String get name {
    switch (this) {
      case ThemeEnum.LIGHT:
        return "LIGHT";
      case ThemeEnum.DARK:
        return "DARK";
    }
  }
}
