import 'package:app_weather/backend/api/weather_api.dart';
import 'package:app_weather/db/dao/city_history_dao.dart';
import 'package:app_weather/di/bloc_module.dart';
import 'package:app_weather/repository/weather_repository.dart';
import 'package:flutter_base/flutter_base.dart';

import 'backend/api/weather_api.dart';
import 'db/dao/city_history_dao.dart';

void provideWeatherApi() {
  di.registerSingleton<WeatherApi>(MyWeatherApi());
}

void provideCityHistoryDao() {
  di.registerSingleton<CityHistoryDao>(MyCityHistoryDao());
}

void provideRepository() {
  di.registerSingleton(WeatherRepository());
}

setupMocks() {
  FlutterBaseLib.setup();
  provideWeatherApi();
  provideCityHistoryDao();
  provideRepository();
  setupBlocModule();
}

unregisterMocks() {
  di.reset(dispose: true);
}
