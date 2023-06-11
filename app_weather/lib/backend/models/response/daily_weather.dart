import 'package:app_weather/backend/models/response/current_weather.dart';
import 'package:json_annotation/json_annotation.dart';

part 'daily_weather.g.dart';

@JsonSerializable()
class DailyWeather {
  final int cnt;
  final List<PeriodicWeather> list;
  final CityData city;

  DailyWeather({
    required this.cnt,
    required this.list,
    required this.city,
  });

  factory DailyWeather.fromJson(Map<String, dynamic> json) => _$DailyWeatherFromJson(json);
  Map<String, dynamic> toJson() => _$DailyWeatherToJson(this);
}

@JsonSerializable()
class PeriodicWeather {
  @JsonKey(
    name: "dt",
    fromJson: _dateFromJson,
    toJson: _dateToJson,
  )
  final DateTime date;
  final MainInfo main;
  final List<Weather> weather;
  final Wind wind;
  final double visibility;

  PeriodicWeather({
    required this.date,
    required this.main,
    required this.weather,
    required this.wind,
    required this.visibility,
  });

  static int _dateToJson(DateTime value) =>
      value.millisecondsSinceEpoch ~/ 1000;
  static DateTime _dateFromJson(int value) =>
      DateTime.fromMillisecondsSinceEpoch(value * 1000);

  factory PeriodicWeather.fromJson(Map<String, dynamic> json) => _$PeriodicWeatherFromJson(json);
  Map<String, dynamic> toJson() => _$PeriodicWeatherToJson(this);
}

@JsonSerializable()
class CityData {
  final int id;
  final String name;
  final Coord coord;
  final String country;
  final int population;
  final int timezone;
  final int sunrise;
  final int sunset;

  CityData({
    required this.id,
    required this.name,
    required this.coord,
    required this.country,
    required this.population,
    required this.timezone,
    required this.sunrise,
    required this.sunset,
  });

  factory CityData.fromJson(Map<String, dynamic> json) => _$CityDataFromJson(json);
  Map<String, dynamic> toJson() => _$CityDataToJson(this);
}
