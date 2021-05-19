import 'package:flutter_modular/flutter_modular.dart';
import 'package:starspace/shared/palette.dart';
import 'package:starspace/shared/theme_enum.dart';
import 'package:starspace/shared/theme_store.dart';
import 'side_force_store.dart';
import 'package:flutter/material.dart';

class SideForcePage extends StatefulWidget {
  final String title;
  const SideForcePage({Key? key, this.title = 'SideForcePage'})
      : super(key: key);
  @override
  SideForcePageState createState() => SideForcePageState();
}

class SideForcePageState extends State<SideForcePage> {
  final SideForceStore store = Modular.get();

  @override
  Widget build(BuildContext context) {
    ThemeStore _themeStore = Modular.get<ThemeStore>();

    return Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("images/texture-backgroud.jpg"),
            fit: BoxFit.cover,
          ),
        ),
        child: Scaffold(
            backgroundColor: Colors.transparent,
            body: Column(
              children: <Widget>[
                Container(
                  alignment: Alignment.topCenter,
                  padding: EdgeInsets.only(top: 20),
                  child: Image.asset("images/logo.png"),
                ),
                Container(
                    alignment: Alignment.topCenter,
                    padding: EdgeInsets.only(top: 20),
                    child: Text(
                      "Em qual lado da força você está?",
                      style: TextStyle(
                          fontFamily: "Start Jedi",
                          color: Palette.secondary,
                          fontSize: 16,
                          shadows: <Shadow>[
                            Shadow(
                                offset: Offset(10.0, 10.0),
                                blurRadius: 3.0,
                                color: Palette.primary)
                          ]),
                    )),
                Container(
                  alignment: Alignment.topCenter,
                  padding: EdgeInsets.only(top: 50),
                  child: ElevatedButton(
                      onPressed: () async {
                        await _themeStore.changeThema(ThemeEnum.DARK);
                        Modular.to.pushNamed("/home");
                      },
                      child: Text("Trevas",
                          style: TextStyle(
                              fontFamily: "Start Jedi",
                              color: Colors.amber,
                              fontSize: 18)),
                      style: ElevatedButton.styleFrom(
                        shape: StadiumBorder(
                            side: BorderSide(color: Colors.amber, width: 2)),
                        minimumSize: Size(200, 50),
                        textStyle: TextStyle(fontSize: 25),
                        primary: Palette.primary, // background
                      )),
                ),
                Container(
                  alignment: Alignment.topCenter,
                  padding: EdgeInsets.only(top: 50),
                  child: ElevatedButton(
                      onPressed: () async {
                        await _themeStore.changeThema(ThemeEnum.LIGHT);
                        Modular.to.pushNamed("/home");
                      },
                      child: Text("Luz",
                          style: TextStyle(
                              fontFamily: "Start Jedi",
                              color: Colors.amber,
                              fontSize: 18)),
                      style: ElevatedButton.styleFrom(
                        shape: StadiumBorder(
                            side: BorderSide(color: Colors.amber, width: 2)),
                        minimumSize: Size(200, 50),
                        textStyle: TextStyle(fontSize: 25),
                        primary: Palette.primary, // background
                      )),
                )
              ],
            )));
  }
}
