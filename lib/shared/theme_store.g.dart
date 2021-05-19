// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'theme_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$ThemeStore on _ThemeStoreBase, Store {
  final _$currentThemeAtom = Atom(name: '_ThemeStoreBase.currentTheme');

  @override
  ThemeData get currentTheme {
    _$currentThemeAtom.reportRead();
    return super.currentTheme;
  }

  @override
  set currentTheme(ThemeData value) {
    _$currentThemeAtom.reportWrite(value, super.currentTheme, () {
      super.currentTheme = value;
    });
  }

  final _$loadingAtom = Atom(name: '_ThemeStoreBase.loading');

  @override
  bool get loading {
    _$loadingAtom.reportRead();
    return super.loading;
  }

  @override
  set loading(bool value) {
    _$loadingAtom.reportWrite(value, super.loading, () {
      super.loading = value;
    });
  }

  final _$themeLoadAtom = Atom(name: '_ThemeStoreBase.themeLoad');

  @override
  bool get themeLoad {
    _$themeLoadAtom.reportRead();
    return super.themeLoad;
  }

  @override
  set themeLoad(bool value) {
    _$themeLoadAtom.reportWrite(value, super.themeLoad, () {
      super.themeLoad = value;
    });
  }

  final _$changeThemaAsyncAction = AsyncAction('_ThemeStoreBase.changeThema');

  @override
  Future<void> changeThema(ThemeEnum theme) {
    return _$changeThemaAsyncAction.run(() => super.changeThema(theme));
  }

  final _$loadThemeAsyncAction = AsyncAction('_ThemeStoreBase.loadTheme');

  @override
  Future<void> loadTheme() {
    return _$loadThemeAsyncAction.run(() => super.loadTheme());
  }

  @override
  String toString() {
    return '''
currentTheme: ${currentTheme},
loading: ${loading},
themeLoad: ${themeLoad}
    ''';
  }
}
