import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:starspace/shared/enums/menu_buton_enum.dart';
import 'package:starspace/shared/palette.dart';
import 'package:starspace/shared/enums/theme_enum.dart';
import 'package:starspace/shared/stores/audio_store.dart';
import 'package:starspace/shared/stores/theme_store.dart';

import 'home_store.dart';

class HomePage extends StatefulWidget {
  final String title;
  const HomePage({Key? key, this.title = "Home"}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends ModularState<HomePage, HomeStore> {
  late AudioCache cache;

  late AudioPlayer player;

  @override
  Widget build(BuildContext context) {
    ThemeStore _themeStore = Modular.get<ThemeStore>();
    AudioSore _audioStore = Modular.get<AudioSore>();

    return Observer(builder: (_) {
      return Scaffold(
          appBar: AppBar(
            centerTitle: true,
            title: Text("starspace"),
            actions: [
              IconButton(
                  icon: Icon(_themeStore.currentTheme == Palette.lightTheme
                      ? Icons.nightlight_round
                      : Icons.wb_sunny),
                  onPressed: () {
                    if (_themeStore.currentTheme == Palette.lightTheme) {
                      _themeStore.changeThema(ThemeEnum.DARK);
                    } else {
                      _themeStore.changeThema(ThemeEnum.LIGHT);
                    }
                  }),
              IconButton(
                iconSize: 30,
                icon: _audioStore.playing
                    ? Icon(Icons.music_off_outlined)
                    : Icon(Icons.music_note_outlined),
                onPressed: () {
                  _audioStore.playing
                      ? _audioStore.stopTheme()
                      : _audioStore.playTheme();
                },
              ),
            ],
          ),
          body: Container(
              padding: EdgeInsets.fromLTRB(15, 30, 15, 0),
              child: GridView.count(
                  crossAxisCount: 2,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                  children: _buttons)));
    });
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
        onTap: () {
          Modular.to.pushNamed(route);
        },
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
                    fontSize: 17),
              ),
              Container(height: 5),
              Container(height: 100, child: image)
            ],
          ),
        ));
  }
}
