import 'package:app_weather/backend/api/weather_api.dart';
import 'package:app_weather/db/dao/city_history_dao.dart';
import 'package:app_weather/repository/weather_repository.dart';
import 'package:flutter_base/di.dart';

void setupRepositoryModule() {
  di.registerSingletonWithDependencies(
    () => WeatherRepository(),
    dependsOn: [WeatherApi, CityHistoryDao],
  );
}
