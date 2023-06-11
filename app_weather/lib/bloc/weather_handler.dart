part of 'weather_bloc.dart';

class WeatherHandler {
  final _weatherRepository = di<WeatherRepository>();
  final _uiBloc = di<UiBloc>();

  Future<void> fetch(
      Emitter<WeatherState> emit, WeatherFetchEvent event) async {
    _uiBloc.setLoading();

    final lat = event.lat;
    final lon = event.lon;

    final currentWeatherResponse =
        await _weatherRepository.getCurrentWeather(lat, lon);
    if (currentWeatherResponse.hasError) {
      return _uiBloc.setError(currentWeatherResponse.error.errorMessage);
    }

    final dailyWeatherResponse =
        await _weatherRepository.getDailyWeather(lat, lon);
    if (dailyWeatherResponse.hasError) {
      return _uiBloc.setError(dailyWeatherResponse.error.errorMessage);
    }

    final currentWeather = currentWeatherResponse.data;

    final mappedWeather = <String, WeatherForecast>{};
    for (var w in dailyWeatherResponse.data.list) {
      final dateStr = formatToDate(w.date);
      final weather = w.weather.firstOrNull;
      final main = w.main;

      mappedWeather[dateStr] = mappedWeather[dateStr]?.let((forecast) {
            final tempMaxValue = forecast.tempMaxValue < main.tempMax
                ? main.tempMax
                : forecast.tempMaxValue;
            final tempMinValue = forecast.tempMinValue > main.tempMin
                ? main.tempMin
                : forecast.tempMinValue;

            WeatherForecast(
              day: forecast.day,
              image: forecast.image,
              weatherCondition: forecast.weatherCondition,
              tempMax: tempMaxValue.celsius,
              tempMin: tempMinValue.celsius,
              tempMaxValue: tempMaxValue,
              tempMinValue: tempMinValue,
            );
          }) ??
          WeatherForecast(
            day: formatToDay(w.date),
            weatherCondition: weather?.description.wordCapitalize() ?? "-",
            image: weather?.icon.weatherIcon ?? "",
            tempMin: main.tempMin.celsius,
            tempMax: main.tempMax.celsius,
            tempMinValue: main.tempMin,
            tempMaxValue: main.tempMax,
          );
    }

    _weatherRepository.insertCityHistory(
      CityHistory(
        currentWeather.id,
        currentWeather.name,
        lat,
        lon,
        DateTime.now().millisecondsSinceEpoch,
      ),
    );

    final weather = currentWeather.weather.firstOrNull;
    final main = currentWeather.main;
    final weather4DaysForecast = mappedWeather.values.toList();

    emit(WeatherFetched(WeatherDisplay(
      id: currentWeather.id,
      cityName: currentWeather.name,
      temp: main.temp.celsiusNoDegree,
      weatherCondition: weather?.description.wordCapitalize() ?? "-",
      image: weather?.icon.weatherIcon ?? "",
      tempMin: main.tempMin.celsius,
      tempMax: main.tempMax.celsius,
      weather5DaysForecast: weather4DaysForecast..removeRange(5, weather4DaysForecast.length),
    )));

    _uiBloc.setIdle();
  }
}
