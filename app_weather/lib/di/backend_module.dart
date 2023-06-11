import 'package:dio/dio.dart';
import 'package:flutter_backend/flutter_backend.dart';
import 'package:flutter_base/config.dart';
import 'package:flutter_base/di.dart';
import 'package:get_it/get_it.dart';

import '../backend/api/interceptors/auth_interceptor.dart';
import '../backend/api/interceptors/auth_refresh_interceptor.dart';
import '../backend/api/interceptors/no_auth_interceptor.dart';
import '../backend/api/weather_api.dart';
import '../constants/api.dart';

void _provideBaseUrl() {
  di.registerSingletonWithDependencies(
    () => BaseUrl(productionUrl: apiUrl, devUrl: apiUrl),
    dependsOn: [EnvConfig],
  );
}

void _provideWeatherApi() {
  di.registerSingletonWithDependencies(
    () => WeatherApi(),
    dependsOn: [InitDependency(Dio, instanceName: dioClientWithAuth)],
  );
}

void _provideInterceptors() {
  di.registerSingletonAsync(
    () async {
      return generateNoAuthInterceptor();
    },
    instanceName: dioClient,
  );
  di.registerSingletonAsync(
    () async {
      return generateAuthInterceptor();
    },
    instanceName: dioClientWithAuth,
  );
  di.registerSingletonAsync(
    () async {
      return generateAuthRefreshInterceptor();
    },
    instanceName: dioClientWithAuthRefresh,
  );
}

void setupBackendModule() {
  _provideBaseUrl();
  _provideInterceptors();
  FlutterBackendLib.setup();
  _provideWeatherApi();
}
