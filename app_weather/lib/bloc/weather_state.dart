part of 'weather_bloc.dart';

@immutable
abstract class WeatherState {
  final WeatherDisplay weatherDisplay;

  const WeatherState({
    this.weatherDisplay = const WeatherDisplay(
      id: 0,
      cityName: "-",
      temp: "-",
      weatherCondition: "-",
      image: "",
      tempMin: "-",
      tempMax: "-",
      weather5DaysForecast: [],
    ),
  });
}

class WeatherInitial extends WeatherState {
  const WeatherInitial() : super();
}

class WeatherFetched extends WeatherState {
  const WeatherFetched(WeatherDisplay weatherDisplay)
      : super(weatherDisplay: weatherDisplay);
}
