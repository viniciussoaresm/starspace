import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:lottie/lottie.dart';
import 'package:mobx/mobx.dart';
import 'package:starspace/app/modules/splash/splash_storage.dart';
import 'package:starspace/shared/palette.dart';
import 'package:starspace/shared/stores/audio_store.dart';
import 'package:starspace/shared/stores/theme_store.dart';

class SplashPage extends StatefulWidget {
  final String title;
  const SplashPage({Key? key, this.title = 'SplashPage'}) : super(key: key);
  @override
  SplashPageState createState() => SplashPageState();
}

class SplashPageState extends ModularState<SplashPage, SplashStorage> {
  ThemeStore _themeStore = Modular.get<ThemeStore>();
  SplashStorage _splashStorage = Modular.get<SplashStorage>();
  AudioSore _audioStore = Modular.get<AudioSore>();

  late ReactionDisposer loadThemeReaction;
  late ReactionDisposer redirectReaction;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    loadThemeReaction = autorun((_) {
      _splashStorage.loadFireBase();
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
    _audioStore.stopTheme();
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
                  ? Column(children: [
                      Container(
                          height: MediaQuery.of(context).size.height * 0.8,
                          alignment: Alignment.center,
                          width: double.infinity,
                          child: Lottie.asset('lotties/bb8.json')),
                      Container(
                          alignment: Alignment.topCenter,
                          padding: EdgeInsets.all(15),
                          child: Ink(
                            decoration: ShapeDecoration(
                              color: Theme.of(context).accentColor,
                              shape: CircleBorder(),
                            ),
                            child: IconButton(
                              iconSize: 30,
                              icon: Icon(_audioStore.playing
                                  ? Icons.music_off
                                  : Icons.music_note),
                              color: Theme.of(context).primaryColor,
                              onPressed: () {
                                _audioStore.playing
                                    ? _audioStore.stopTheme()
                                    : _audioStore.playTheme();
                              },
                            ),
                          ))
                    ])
                  : Column(
                      children: <Widget>[
                        Container(
                          height: MediaQuery.of(context).size.height * 0.60,
                          alignment: Alignment.topCenter,
                          padding: EdgeInsets.only(top: 20),
                          child: Image.asset("images/logo.png"),
                        ),
                        Container(
                            height: MediaQuery.of(context).size.height * 0.15,
                            alignment: Alignment.topCenter,
                            padding: EdgeInsets.all(15),
                            child: Text(
                              "esta pronto para essa jornada?",
                              style: TextStyle(
                                  fontFamily: "Start Jedi",
                                  color: Palette.secondary,
                                  fontSize: 14,
                                  shadows: <Shadow>[
                                    Shadow(
                                        offset: Offset(10.0, 10.0),
                                        blurRadius: 3.0,
                                        color: Palette.primary)
                                  ]),
                            )),
                        Container(
                          height: MediaQuery.of(context).size.height * 0.15,
                          alignment: Alignment.topCenter,
                          padding: EdgeInsets.all(15),
                          child: ElevatedButton(
                              onPressed: () =>
                                  Modular.to.pushReplacementNamed("/sideForce"),
                              child: Text("Decolar",
                                  style: TextStyle(
                                      fontFamily: "Start Jedi",
                                      color: Palette.primary,
                                      fontSize: 18)),
                              style: ElevatedButton.styleFrom(
                                minimumSize: Size(150, 40),
                                textStyle: TextStyle(fontSize: 25),
                                primary: Colors.white, // background
                              )),
                        )
                      ],
                    );
            })));
  }
}
