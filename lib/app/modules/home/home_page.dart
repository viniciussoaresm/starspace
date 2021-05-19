import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:starspace/shared/menu_buton_enum.dart';
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
        appBar: AppBar(
          centerTitle: true,
          title: Text("starspace"),
          actions: [
            IconButton(
                icon: Icon(Icons.lightbulb_outline),
                onPressed: () {
                  if (_themeStore.currentTheme == Palette.lightTheme) {
                    _themeStore.changeThema(ThemeEnum.DARK);
                  } else {
                    _themeStore.changeThema(ThemeEnum.LIGHT);
                  }
                })
          ],
        ),
        body: Container(
            padding: EdgeInsets.all(15),
            child: GridView.count(
                crossAxisCount: 2,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
                children: _buttons)));
  }

  List<Widget> get _buttons {
    List<Widget> buttons = [];

    for (var value in MenuButtonEnum.values) {
      buttons.add(_button(value.route, value.text, value.image));
    }

    return buttons;
  }

  Widget _button(String route, String text, Image image) {
    return GestureDetector(
        onTap: () {},
        child: Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Theme.of(context).accentColor),
          child: Column(
            children: [
              Text(
                text,
                style: TextStyle(
                    fontFamily: "Start Jedi",
                    color: Theme.of(context).primaryColor,
                    fontSize: 18),
              ),
              Container(height: 5),
              Container(height: 100, child: image)
            ],
          ),
        ));
  }
}
