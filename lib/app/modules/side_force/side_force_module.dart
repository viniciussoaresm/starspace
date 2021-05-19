import 'side_force_Page.dart';
import 'side_force_store.dart';
import 'package:flutter_modular/flutter_modular.dart';

class SideForceModule extends Module {
  @override
  final List<Bind> binds = [
    Bind.lazySingleton((i) => SideForceStore()),
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute('/', child: (_, args) => SideForcePage()),
  ];
}
