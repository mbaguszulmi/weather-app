import 'package:app_weather/backend/models/response/base_response.dart';
import 'package:app_weather/util/api_utils.dart';
import 'package:flutter_base/di.dart';

import '../backend/api/weather_api.dart';
import '../backend/models/response/current_weather.dart';
import '../backend/models/response/daily_weather.dart';
import '../db/dao/city_history_dao.dart';
import '../db/entity/city_history.dart';
import '../model/city.dart';

class WeatherRepository {
  final weatherApi = di<WeatherApi>();
  final cityHistoryDao = di<CityHistoryDao>();

  Stream<List<CityHistory>> getRecentSearch() =>
      cityHistoryDao.getCityHistories();

  Future<void> insertCityHistory(CityHistory cityHistory) =>
      cityHistoryDao.insertCityHistory(cityHistory);

  Future<BaseResponse<List<City>>> findCity(String q) =>
      handleApi(request: () => weatherApi.findCity(q));

  Future<BaseResponse<CurrentWeather>> getCurrentWeather(
    double lat,
    double lon,
  ) =>
      handleApi(request: () => weatherApi.getCurrentWeather(lat, lon));

  Future<BaseResponse<DailyWeather>> getDailyWeather(double lat, double lon) =>
      handleApi(request: () => weatherApi.getDailyWeather(lat, lon));
}
