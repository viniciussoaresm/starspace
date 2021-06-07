import 'package:mobx/mobx.dart';
import 'package:starspace/shared/models/character.dart';
import 'package:starspace/shared/repositories/charecters_repository_interface.dart';

part 'characters_store.g.dart';

class CharactersStore = _CharactersStoreBase with _$CharactersStore;

abstract class _CharactersStoreBase with Store {
  final CharactersRepositoryInterface repository;

  @computed
  bool get loaded => characters.isNotEmpty;

  @observable
  List<Character> characters = [];

  @observable
  bool searching = false;

  int itemPerPage = 10;

  @observable
  List<Character> pageitem = [];

  @action
  Future<void> load() async {
    characters = await repository.getAll();
    if (characters.isNotEmpty) {
      pageitem = characters.sublist(0, _getItemsPerPages);
    }
  }

  @action
  Future<void> nextPage() async {
    pageitem = characters.sublist(0, _getItemsPerPages);
  }

  @action
  Future<void> changeSearching() async => searching = !searching;

  @action
  Future<void> search(String textFilter) async {
    if (textFilter.isNotEmpty) {
      pageitem = characters
          .where((element) =>
              element.name.toLowerCase().contains(textFilter.toLowerCase()))
          .toList();
    } else {
      pageitem = [];
      pageitem = characters.sublist(0, _getItemsPerPages);
    }
  }

  int get _getItemsPerPages =>
      pageitem.length + itemPerPage >= characters.length
          ? characters.length
          : pageitem.length + itemPerPage;

  _CharactersStoreBase(this.repository);
}
