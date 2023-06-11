part of 'weather_history_bloc.dart';

class WeatherHistoryHandler {
  final _weatherRepository = di<WeatherRepository>();
  final _uiBloc = di<UiBloc>();
  StreamSubscription<List<CityHistory>>? _historySubscription;

  void initHistoryListener(void Function(WeatherHistoryEvent event) add) {
    _historySubscription = _weatherRepository.getRecentSearch().listen(
      (histories) async {
        _uiBloc.setLoading();

        add(WeatherHistoryUpdateEvent(
          await Future.wait(histories.map(
            (h) async {
              final response = await _weatherRepository.getCurrentWeather(
                h.lat,
                h.lon,
              );

              if (response.hasError) {
                _uiBloc.setError(response.error.errorMessage);
                return CityDisplay(
                  id: h.id,
                  name: h.name,
                );
              }

              final currentWeather = response.data;
              final weather = currentWeather.weather.firstOrNull;

              return CityDisplay(
                id: h.id,
                name: h.name,
                weatherCondition: weather?.description.wordCapitalize() ?? "-",
                temp: currentWeather.main.temp.celsiusNoDegree,
                image: weather?.icon.weatherIcon ?? "",
                time: formatToTime(currentWeather.date),
                lat: currentWeather.coord.lat,
                lon: currentWeather.coord.lon,
              );
            },
          ).toList()),
        ));

        _uiBloc.setIdle();
      },
    );
  }

  void updateWeatherHistoryDisplay(
      Emitter<WeatherHistoryState> emit, List<CityDisplay> cities) {
    emit(WeatherHistoryFetched(cities));
  }

  void disposeHistoryListener() {
    _historySubscription?.cancel();
  }

  Future<void> addWeatherHistory(
    Emitter<WeatherHistoryState> emit,
    CityHistory cityHistory,
  ) {
    return _weatherRepository.insertCityHistory(cityHistory);
  }
}
