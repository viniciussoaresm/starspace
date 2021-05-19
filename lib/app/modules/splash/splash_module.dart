import 'package:flutter_modular/flutter_modular.dart';
import 'package:starspace/app/modules/splash/splash_page.dart';
import 'package:starspace/app/modules/splash/splash_storage.dart';

class SplashModule extends Module {
  @override
  final List<Bind> binds = [
    Bind.lazySingleton((i) => SplashStorage()),
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute("/", child: (_, args) => SplashPage()),
  ];
}
