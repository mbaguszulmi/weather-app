import 'package:app_weather/backend/models/response/current_weather.dart';
import 'package:app_weather/backend/models/response/daily_weather.dart';
import 'package:app_weather/model/city.dart';
import 'package:dio/dio.dart';
import 'package:flutter_backend/di.dart';
import 'package:flutter_base/di.dart';
import 'package:retrofit/retrofit.dart';

part 'weather_api.g.dart';

@RestApi()
abstract class WeatherApi {
  factory WeatherApi() {
    final dio = di<Dio>(instanceName: dioClientWithAuth);
    return _WeatherApi(dio);
  }

  @GET("geo/1.0/direct")
  Future<List<City>> findCity(
    @Query("q") String query, {
    @Query("limit") int limit = 5,
  });

  @GET("data/2.5/weather")
  Future<CurrentWeather> getCurrentWeather(
    @Query("lat") double lat,
    @Query("lon") double lon,
  );

  @GET("data/2.5/forecast")
  Future<DailyWeather> getDailyWeather(
    @Query("lat") double lat,
    @Query("lon") double lon,
  );
}
