import 'package:dio/dio.dart';

// No Auth API doesn't need any interceptors
Interceptors generateNoAuthInterceptor() {
  return Interceptors();
}