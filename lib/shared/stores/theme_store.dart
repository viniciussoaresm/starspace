import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:starspace/shared/palette.dart';
import 'package:starspace/shared/enums/theme_enum.dart';
part 'theme_store.g.dart';

class ThemeStore = _ThemeStoreBase with _$ThemeStore;

abstract class _ThemeStoreBase with Store {
  static const String DARK = "DARK";
  static const String LIGHT = "LIGHT";

  @observable
  ThemeData currentTheme = Palette.darkTheme;

  @observable
  bool loading = true;

  @observable
  bool themeLoad = false;

  @action
  Future<void> changeThema(ThemeEnum theme) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    sharedPreferences.setString("theme", theme.name);
    currentTheme = theme.theme;
  }

  @action
  Future<void> loadTheme() async {
    await Future.delayed(Duration(seconds: 5));
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    String? _theme = sharedPreferences.getString("theme");

    if (_theme != null) {
      switch (_theme) {
        case DARK:
          currentTheme = Palette.darkTheme;
          break;
        case LIGHT:
          currentTheme = Palette.lightTheme;
          break;
        default:
          currentTheme = Palette.darkTheme;
      }
      themeLoad = true;
    }
    loading = false;
  }
}
