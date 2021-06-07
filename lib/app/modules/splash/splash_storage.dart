import 'package:firebase_core/firebase_core.dart';
import 'package:mobx/mobx.dart';
part 'splash_storage.g.dart';

class SplashStorage = _SplashStorageBase with _$SplashStorage;

abstract class _SplashStorageBase with Store {
  Future<void> loadFireBase() async {
    await Firebase.initializeApp();
  }
}
