import 'package:json_annotation/json_annotation.dart';

part 'current_weather.g.dart';

@JsonSerializable()
class CurrentWeather {
  final Coord coord;
  final List<Weather> weather;
  final String base;
  final MainInfo main;
  final double visibility;
  final Wind wind;
  @JsonKey(
    name: "dt",
    fromJson: _dateFromJson,
    toJson: _dateToJson,
  )
  final DateTime date;
  final int timezone;
  final int id;
  final String name;

  CurrentWeather({
    required this.coord,
    required this.weather,
    required this.base,
    required this.main,
    required this.visibility,
    required this.wind,
    required this.date,
    required this.timezone,
    required this.id,
    required this.name,
  });

  static int _dateToJson(DateTime value) => value.millisecondsSinceEpoch ~/ 1000;
  static DateTime _dateFromJson(int value) =>
      DateTime.fromMillisecondsSinceEpoch(value * 1000);

  factory CurrentWeather.fromJson(Map<String, dynamic> json) => _$CurrentWeatherFromJson(json);
  Map<String, dynamic> toJson() => _$CurrentWeatherToJson(this);
}

@JsonSerializable()
class Coord {
  final double lat;
  final double lon;

  Coord({
    required this.lat,
    required this.lon,
  });

  factory Coord.fromJson(Map<String, dynamic> json) => _$CoordFromJson(json);
  Map<String, dynamic> toJson() => _$CoordToJson(this);
}

@JsonSerializable()
class Weather {
  final int id;
  final String main;
  final String description;
  final String icon;

  Weather({
    required this.id,
    required this.main,
    required this.description,
    required this.icon,
  });

  factory Weather.fromJson(Map<String, dynamic> json) => _$WeatherFromJson(json);
  Map<String, dynamic> toJson() => _$WeatherToJson(this);
}

@JsonSerializable()
class MainInfo {
  final double temp;
  @JsonKey(name: "feels_like")
  final double feelsLike;
  @JsonKey(name: "temp_min")
  final double tempMin;
  @JsonKey(name: "temp_max")
  final double tempMax;
  final double pressure;
  final double humidity;
  @JsonKey(name: "sea_level")
  final double seaLevel;
  @JsonKey(name: "grnd_level")
  final double grndLevel;

  MainInfo({
    required this.temp,
    required this.feelsLike,
    required this.tempMin,
    required this.tempMax,
    this.pressure = 0,
    this.humidity = 0,
    this.seaLevel = 0,
    this.grndLevel = 0,
  });

  factory MainInfo.fromJson(Map<String, dynamic> json) => _$MainInfoFromJson(json);
  Map<String, dynamic> toJson() => _$MainInfoToJson(this);
}

@JsonSerializable()
class Wind {
  final double speed;
  final double deg;
  final double gust;

  Wind({
    this.speed = 0,
    this.deg = 0,
    this.gust = 0,
  });

  factory Wind.fromJson(Map<String, dynamic> json) => _$WindFromJson(json);
  Map<String, dynamic> toJson() => _$WindToJson(this);
}
