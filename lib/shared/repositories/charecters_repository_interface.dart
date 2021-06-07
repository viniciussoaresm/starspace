import 'package:starspace/shared/models/character.dart';

abstract class CharactersRepositoryInterface {
  Future<List<Character>> getAll();
}
