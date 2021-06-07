import 'package:audioplayers/audioplayers.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:starspace/app/modules/characters/characters_module.dart';
import 'package:starspace/app/modules/home/home_module.dart';
import 'package:starspace/app/modules/side_force/side_force_module.dart';
import 'package:starspace/app/modules/splash/splash_module.dart';
import 'package:starspace/shared/stores/audio_store.dart';
import 'package:starspace/shared/stores/theme_store.dart';

class AppModule extends Module {
  @override
  final List<Bind> binds = [
    Bind.lazySingleton((i) => ThemeStore()),
    Bind.lazySingleton((i) => AudioCache(prefix: "assets/sounds/")),
    Bind.lazySingleton((i) => AudioPlayer()),
    Bind.lazySingleton(
        (i) => AudioSore(i.get<AudioCache>(), i.get<AudioPlayer>())),
  ];

  @override
  final List<ModularRoute> routes = [
    ModuleRoute(Modular.initialRoute, module: SplashModule()),
    ModuleRoute("/sideForce", module: SideForceModule()),
    ModuleRoute("/home", module: HomeModule()),
    ModuleRoute("/characters", module: CharactersModule())
  ];
}
