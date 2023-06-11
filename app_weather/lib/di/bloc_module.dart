import 'package:app_weather/bloc/ui_bloc.dart';
import 'package:flutter_base/di.dart';

void _provideUiBloc() {
  di.registerSingleton(UiBloc());
}

void setupBlocModule() {
  _provideUiBloc();
}
