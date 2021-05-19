import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:starspace/shared/palette.dart';
import 'package:starspace/shared/theme_enum.dart';
import 'package:starspace/shared/theme_store.dart';

import 'home_store.dart';

class HomePage extends StatefulWidget {
  final String title;
  const HomePage({Key? key, this.title = "Home"}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends ModularState<HomePage, HomeStore> {
  @override
  Widget build(BuildContext context) {
    ThemeStore _themeStore = Modular.get<ThemeStore>();

    return Scaffold(
        floatingActionButton: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            FloatingActionButton(
              onPressed: () => _themeStore.changeThema(ThemeEnum.LIGHT),
              child: Icon(Icons.lightbulb_outline),
            ),
            FloatingActionButton(
              onPressed: () => _themeStore.changeThema(ThemeEnum.DARK),
              child: Icon(Icons.lightbulb),
            ),
          ],
        ),
        appBar: AppBar(
          centerTitle: true,
          title: Text("starspace"),
        ),
        body: Container());
  }
}
