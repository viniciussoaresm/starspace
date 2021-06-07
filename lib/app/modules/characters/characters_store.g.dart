// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'characters_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$CharactersStore on _CharactersStoreBase, Store {
  Computed<bool>? _$loadedComputed;

  @override
  bool get loaded => (_$loadedComputed ??= Computed<bool>(() => super.loaded,
          name: '_CharactersStoreBase.loaded'))
      .value;

  final _$charactersAtom = Atom(name: '_CharactersStoreBase.characters');

  @override
  List<Character> get characters {
    _$charactersAtom.reportRead();
    return super.characters;
  }

  @override
  set characters(List<Character> value) {
    _$charactersAtom.reportWrite(value, super.characters, () {
      super.characters = value;
    });
  }

  final _$searchingAtom = Atom(name: '_CharactersStoreBase.searching');

  @override
  bool get searching {
    _$searchingAtom.reportRead();
    return super.searching;
  }

  @override
  set searching(bool value) {
    _$searchingAtom.reportWrite(value, super.searching, () {
      super.searching = value;
    });
  }

  final _$pageitemAtom = Atom(name: '_CharactersStoreBase.pageitem');

  @override
  List<Character> get pageitem {
    _$pageitemAtom.reportRead();
    return super.pageitem;
  }

  @override
  set pageitem(List<Character> value) {
    _$pageitemAtom.reportWrite(value, super.pageitem, () {
      super.pageitem = value;
    });
  }

  final _$loadAsyncAction = AsyncAction('_CharactersStoreBase.load');

  @override
  Future<void> load() {
    return _$loadAsyncAction.run(() => super.load());
  }

  final _$nextPageAsyncAction = AsyncAction('_CharactersStoreBase.nextPage');

  @override
  Future<void> nextPage() {
    return _$nextPageAsyncAction.run(() => super.nextPage());
  }

  final _$changeSearchingAsyncAction =
      AsyncAction('_CharactersStoreBase.changeSearching');

  @override
  Future<void> changeSearching() {
    return _$changeSearchingAsyncAction.run(() => super.changeSearching());
  }

  final _$searchAsyncAction = AsyncAction('_CharactersStoreBase.search');

  @override
  Future<void> search(String textFilter) {
    return _$searchAsyncAction.run(() => super.search(textFilter));
  }

  @override
  String toString() {
    return '''
characters: ${characters},
searching: ${searching},
pageitem: ${pageitem},
loaded: ${loaded}
    ''';
  }
}
