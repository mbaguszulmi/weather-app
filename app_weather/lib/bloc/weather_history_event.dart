part of 'weather_history_bloc.dart';

@immutable
abstract class WeatherHistoryEvent {
  const WeatherHistoryEvent();
}

class WeatherHistoryInitEvent extends WeatherHistoryEvent {
  const WeatherHistoryInitEvent(): super();
}

class WeatherHistoryDisposeEvent extends WeatherHistoryEvent {
  const WeatherHistoryDisposeEvent(): super();
}

class WeatherHistoryUpdateEvent extends WeatherHistoryEvent {
  final List<CityDisplay> cities;

  const WeatherHistoryUpdateEvent(this.cities): super();
}

class AddWeatherHistoryEvent extends WeatherHistoryEvent {
  final CityHistory cityHistory;

  const AddWeatherHistoryEvent(this.cityHistory): super();
}
