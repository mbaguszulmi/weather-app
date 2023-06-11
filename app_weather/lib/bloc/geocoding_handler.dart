part of 'geocoding_bloc.dart';

class GeocodingHandler {
  final _weatherRepository = di<WeatherRepository>();
  final _uiBloc = di<UiBloc>();

  Future<void> searchCity(Emitter<GeocodingState> emit, String query) async {
    _uiBloc.setLoading();

    final response = await _weatherRepository.findCity(query);

    if (response.hasError) {
      return _uiBloc.setError(response.error.errorMessage);
    }

    final cities = response.data
        .map(
          (c) => SearchCityDisplay(
            "${c.name}, ${c.state}, ${c.country}",
            c.lat,
            c.lon,
          ),
        )
        .toList();

    emit(GeocodingFetched(cities));

    _uiBloc.setIdle();
  }

  reset(Emitter<GeocodingState> emit) {
    emit(const GeocodingInitial());
  }
}
