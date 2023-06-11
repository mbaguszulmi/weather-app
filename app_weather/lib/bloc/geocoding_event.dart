part of 'geocoding_bloc.dart';

@immutable
abstract class GeocodingEvent {
  const GeocodingEvent();
}

class SearchCityEvent extends GeocodingEvent {
  final String query;
  const SearchCityEvent(this.query): super();
}

class GeocodingResetEvent extends GeocodingEvent {
  const GeocodingResetEvent(): super();
}
