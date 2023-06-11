import 'di/config_module.dart';
import 'di/storage_module.dart';

class FlutterBaseLib {
  static void setup() {
    initializeConfigModule();
    initializeStorageModule();
  }
}
