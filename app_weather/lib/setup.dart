import 'package:app_weather/di/backend_module.dart';
import 'package:app_weather/di/bloc_module.dart';
import 'package:app_weather/di/db_module.dart';
import 'package:app_weather/di/repository_module.dart';

class App {
  static void setup() {
    setupBackendModule();
    setupDbModule();
    setupRepositoryModule();
    setupBlocModule();
  }
}
