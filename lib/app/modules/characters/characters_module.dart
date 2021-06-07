import 'package:starspace/shared/repositories/characters_repository.dart';

import 'characters_page.dart';
import 'characters_store.dart';
import 'package:flutter_modular/flutter_modular.dart';

class CharactersModule extends Module {
  @override
  final List<Bind> binds = [
    Bind.lazySingleton((i) => CharactersStore(i.get())),
    Bind.lazySingleton((i) => CharactersRepository())
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute('/', child: (_, args) => CharactersPage()),
  ];
}
