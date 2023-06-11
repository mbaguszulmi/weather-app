// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'daily_weather.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DailyWeather _$DailyWeatherFromJson(Map<String, dynamic> json) => DailyWeather(
      cnt: json['cnt'] as int,
      list: (json['list'] as List<dynamic>)
          .map((e) => PeriodicWeather.fromJson(e as Map<String, dynamic>))
          .toList(),
      city: CityData.fromJson(json['city'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$DailyWeatherToJson(DailyWeather instance) =>
    <String, dynamic>{
      'cnt': instance.cnt,
      'list': instance.list,
      'city': instance.city,
    };

PeriodicWeather _$PeriodicWeatherFromJson(Map<String, dynamic> json) =>
    PeriodicWeather(
      date: PeriodicWeather._dateFromJson(json['dt'] as int),
      main: MainInfo.fromJson(json['main'] as Map<String, dynamic>),
      weather: (json['weather'] as List<dynamic>)
          .map((e) => Weather.fromJson(e as Map<String, dynamic>))
          .toList(),
      wind: Wind.fromJson(json['wind'] as Map<String, dynamic>),
      visibility: (json['visibility'] as num).toDouble(),
    );

Map<String, dynamic> _$PeriodicWeatherToJson(PeriodicWeather instance) =>
    <String, dynamic>{
      'dt': PeriodicWeather._dateToJson(instance.date),
      'main': instance.main,
      'weather': instance.weather,
      'wind': instance.wind,
      'visibility': instance.visibility,
    };

CityData _$CityDataFromJson(Map<String, dynamic> json) => CityData(
      id: json['id'] as int,
      name: json['name'] as String,
      coord: Coord.fromJson(json['coord'] as Map<String, dynamic>),
      country: json['country'] as String,
      population: json['population'] as int,
      timezone: json['timezone'] as int,
      sunrise: json['sunrise'] as int,
      sunset: json['sunset'] as int,
    );

Map<String, dynamic> _$CityDataToJson(CityData instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'coord': instance.coord,
      'country': instance.country,
      'population': instance.population,
      'timezone': instance.timezone,
      'sunrise': instance.sunrise,
      'sunset': instance.sunset,
    };
