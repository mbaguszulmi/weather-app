import 'package:app_weather/util/ez_extensions.dart';
import 'package:app_weather/util/string_extension.dart';
import 'package:app_weather/util/weather_extensions.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_base/di.dart';
import 'package:meta/meta.dart';

import '../db/entity/city_history.dart';
import '../model/weather_display.dart';
import '../repository/weather_repository.dart';
import '../util/date_utils.dart';
import 'ui_bloc.dart';

part 'weather_event.dart';
part 'weather_handler.dart';
part 'weather_state.dart';

class WeatherBloc extends Bloc<WeatherEvent, WeatherState> {
  WeatherBloc() : super(const WeatherInitial()) {
    final handler = WeatherHandler();

    on<WeatherEvent>((event, emit) async {
      if (event is WeatherFetchEvent) {
        await handler.fetch(emit, event);
      }
    });
  }

  void fetch(double lat, double lon) {
    add(WeatherFetchEvent(lat, lon));
  }
}
