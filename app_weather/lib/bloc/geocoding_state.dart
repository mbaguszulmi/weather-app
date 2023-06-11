part of 'geocoding_bloc.dart';

@immutable
abstract class GeocodingState {
  final List<SearchCityDisplay> cities;

  const GeocodingState({this.cities = const []});
}

class GeocodingInitial extends GeocodingState {
  const GeocodingInitial(): super();
}

class GeocodingFetched extends GeocodingState {
  const GeocodingFetched(List<SearchCityDisplay> cities): super(cities: cities);
}
