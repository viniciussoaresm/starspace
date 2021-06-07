// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'audio_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$AudioSore on _AudioSoreBase, Store {
  final _$playingAtom = Atom(name: '_AudioSoreBase.playing');

  @override
  bool get playing {
    _$playingAtom.reportRead();
    return super.playing;
  }

  @override
  set playing(bool value) {
    _$playingAtom.reportWrite(value, super.playing, () {
      super.playing = value;
    });
  }

  final _$playThemeAsyncAction = AsyncAction('_AudioSoreBase.playTheme');

  @override
  Future<void> playTheme() {
    return _$playThemeAsyncAction.run(() => super.playTheme());
  }

  final _$stopThemeAsyncAction = AsyncAction('_AudioSoreBase.stopTheme');

  @override
  Future<void> stopTheme() {
    return _$stopThemeAsyncAction.run(() => super.stopTheme());
  }

  @override
  String toString() {
    return '''
playing: ${playing}
    ''';
  }
}
