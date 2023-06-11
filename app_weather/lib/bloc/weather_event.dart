part of 'weather_bloc.dart';

@immutable
abstract class WeatherEvent {
  const WeatherEvent();
}

class WeatherFetchEvent extends WeatherEvent {
  final double lat, lon;

  const WeatherFetchEvent(this.lat, this.lon) : super();
}
