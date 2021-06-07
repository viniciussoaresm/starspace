import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:starspace/shared/stores/theme_store.dart';

class AppWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    ThemeStore _themeStore = Modular.get<ThemeStore>();

    return Observer(builder: (_) {
      return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Starspace',
        theme: _themeStore.currentTheme,
      ).modular();
    });
  }
}
