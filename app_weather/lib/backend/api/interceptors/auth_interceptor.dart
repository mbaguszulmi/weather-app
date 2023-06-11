import 'package:app_weather/constants/api.dart';
import 'package:dio/dio.dart';

// Generate interceptor for API that needs authentication
Interceptors generateAuthInterceptor() {
  return Interceptors()
    ..addAll([
      InterceptorsWrapper(
        onRequest: (options, handler) {
          options.queryParameters["appid"] = appid;
          handler.next(options);
        },
      ),
    ]);
}
