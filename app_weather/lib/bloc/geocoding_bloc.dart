import 'package:bloc/bloc.dart';
import 'package:flutter_base/di.dart';
import 'package:meta/meta.dart';

import '../model/search_city_display.dart';
import '../repository/weather_repository.dart';
import 'ui_bloc.dart';

part 'geocoding_event.dart';
part 'geocoding_handler.dart';
part 'geocoding_state.dart';

class GeocodingBloc extends Bloc<GeocodingEvent, GeocodingState> {
  GeocodingBloc() : super(const GeocodingInitial()) {
    final handler = GeocodingHandler();

    on<GeocodingEvent>((event, emit) async {
      if (event is SearchCityEvent) {
        await handler.searchCity(emit, event.query);
      } else if (event is GeocodingResetEvent) {
        await handler.reset(emit);
      }
    });
  }

  void searchCity(String query) {
    add(SearchCityEvent(query));
  }

  void reset() {
    add(const GeocodingResetEvent());
  }
}
