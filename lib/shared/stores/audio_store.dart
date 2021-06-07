import 'package:audioplayers/audioplayers.dart';
import 'package:mobx/mobx.dart';
import 'package:starspace/shared/enums/audio_enum.dart';
part 'audio_store.g.dart';

class AudioSore = _AudioSoreBase with _$AudioSore;

abstract class _AudioSoreBase with Store {
  final AudioCache cache;
  AudioPlayer player;

  _AudioSoreBase(this.cache, this.player);

  @observable
  bool playing = false;

  @action
  Future<void> playTheme() async {
    playing = true;
    player = await cache.loop(AudioEnum.Theme.name);
  }

  @action
  Future<void> stopTheme() async {
    player.stop();
    playing = false;
  }
}
