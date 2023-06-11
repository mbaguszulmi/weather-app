part of 'weather_history_bloc.dart';

@immutable
abstract class WeatherHistoryState {
  final List<CityDisplay> cities;

  const WeatherHistoryState({this.cities = const []});
}

class WeatherHistoryInitial extends WeatherHistoryState {
  const WeatherHistoryInitial() : super();
}

class WeatherHistoryFetched extends WeatherHistoryState {
  const WeatherHistoryFetched(List<CityDisplay> cities) : super(cities: cities);
}
