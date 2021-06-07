enum AudioEnum { Theme }

extension AudioEnumExt on AudioEnum {
  String get name {
    switch (this) {
      case AudioEnum.Theme:
        return 'theme-startwars.mp3';
    }
  }
}
