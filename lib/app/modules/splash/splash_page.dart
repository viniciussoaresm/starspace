import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
import 'package:starspace/app/modules/splash/splash_storage.dart';
import 'package:starspace/shared/palette.dart';
import 'package:starspace/shared/theme_store.dart';

class SplashPage extends StatefulWidget {
  final String title;
  const SplashPage({Key? key, this.title = 'SplashPage'}) : super(key: key);
  @override
  SplashPageState createState() => SplashPageState();
}

class SplashPageState extends ModularState<SplashPage, SplashStorage> {
  ThemeStore _themeStore = Modular.get<ThemeStore>();
  late ReactionDisposer loadThemeReaction;
  late ReactionDisposer redirectReaction;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    loadThemeReaction = autorun((_) {
      _themeStore.loadTheme();
    });

    redirectReaction = when((_) => _themeStore.themeLoad, () {
      Modular.to.pushReplacementNamed("/home");
    });
  }

  @override
  void dispose() {
    super.dispose();
    loadThemeReaction.reaction.dispose();
    redirectReaction.reaction.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("images/texture-backgroud.jpg"),
            fit: BoxFit.cover,
          ),
        ),
        child: Scaffold(
            backgroundColor: Colors.transparent,
            body: Observer(builder: (_) {
              return _themeStore.loading || _themeStore.themeLoad
                  ? Image.asset("images/load-gif.gif")
                  : Column(
                      children: <Widget>[
                        Container(
                            alignment: Alignment.topCenter,
                            padding: EdgeInsets.only(top: 80),
                            child: Text(
                              "olá, jovem padawan",
                              style: TextStyle(
                                  fontFamily: "Start Jedi",
                                  color: Palette.secondary,
                                  fontSize: 21,
                                  shadows: <Shadow>[
                                    Shadow(
                                        offset: Offset(10.0, 10.0),
                                        blurRadius: 3.0,
                                        color: Palette.primary)
                                  ]),
                            )),
                        Container(
                          alignment: Alignment.topCenter,
                          padding: EdgeInsets.only(top: 20),
                          child: Image.asset("images/logo.png"),
                        ),
                        Container(
                            alignment: Alignment.topCenter,
                            padding: EdgeInsets.only(top: 20),
                            child: Text(
                              "esta pronto para essa jornada?",
                              style: TextStyle(
                                  fontFamily: "Start Jedi",
                                  color: Palette.secondary,
                                  fontSize: 18,
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
                              onPressed: () =>
                                  Modular.to.pushReplacementNamed("/sideForce"),
                              child: Text("Decolar",
                                  style: TextStyle(
                                      fontFamily: "Start Jedi",
                                      color: Palette.primary,
                                      fontSize: 18)),
                              style: ElevatedButton.styleFrom(
                                minimumSize: Size(200, 50),
                                textStyle: TextStyle(fontSize: 25),
                                primary: Colors.white, // background
                              )),
                        )
                      ],
                    );
            })));
  }
}
