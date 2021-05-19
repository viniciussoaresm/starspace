import 'package:flutter_modular/flutter_modular.dart';
import 'package:starspace/app/modules/home/home_module.dart';
import 'package:starspace/app/modules/side_force/side_force_module.dart';
import 'package:starspace/app/modules/splash/splash_module.dart';
import 'package:starspace/shared/theme_store.dart';

class AppModule extends Module {
  @override
  final List<Bind> binds = [Bind.lazySingleton((i) => ThemeStore())];

  @override
  final List<ModularRoute> routes = [
    ModuleRoute(Modular.initialRoute, module: SplashModule()),
    ModuleRoute("/sideForce", module: SideForceModule()),
    ModuleRoute("/home", module: HomeModule())
  ];
}
