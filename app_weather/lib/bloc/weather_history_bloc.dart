import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter_base/di.dart';
import 'package:meta/meta.dart';

import '../db/entity/city_history.dart';
import '../model/city_display.dart';
import '../repository/weather_repository.dart';
import '../util/date_utils.dart';
import '../util/string_extension.dart';
import '../util/weather_extensions.dart';
import 'ui_bloc.dart';

part 'weather_history_event.dart';
part 'weather_history_handler.dart';
part 'weather_history_state.dart';

class WeatherHistoryBloc
    extends Bloc<WeatherHistoryEvent, WeatherHistoryState> {
  WeatherHistoryBloc() : super(const WeatherHistoryInitial()) {
    final handler = WeatherHistoryHandler();

    on<WeatherHistoryEvent>((event, emit) async {
      if (event is WeatherHistoryInitEvent) {
        handler.initHistoryListener(add);
      } else if (event is WeatherHistoryDisposeEvent) {
        handler.disposeHistoryListener();
      } else if (event is AddWeatherHistoryEvent) {
        await handler.addWeatherHistory(emit, event.cityHistory);
      } else if (event is WeatherHistoryUpdateEvent) {
        handler.updateWeatherHistoryDisplay(emit, event.cities);
      }
    });
  }

  void init() {
    add(const WeatherHistoryInitEvent());
  }

  void dispose() {
    add(const WeatherHistoryDisposeEvent());
  }

  void addHistory(CityHistory cityHistory) {
    add(AddWeatherHistoryEvent(cityHistory));
  }

  @override
  Future<void> close() {
    dispose();
    return super.close();
  }
}
