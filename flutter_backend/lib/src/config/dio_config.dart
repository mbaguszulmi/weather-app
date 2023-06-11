import 'dart:io';

import 'package:dio/dio.dart';
import 'package:dio/io.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_backend/src/constants/api.dart';
import 'package:flutter_backend/src/constants/constants.dart';
import 'package:flutter_base/di.dart';

Dio generateDioClient(String qualifier) {
  final baseUrl = di<BaseUrl>();
  final Interceptors interceptors = di<Interceptors>(instanceName: qualifier);

  final dio = Dio(BaseOptions(
    baseUrl: baseUrl.base,
    connectTimeout: const Duration(milliseconds: dioConnectTimeout),
    receiveTimeout: const Duration(milliseconds: dioReceiveTimeout),
  ));

  if (kDebugMode) {
    (dio.httpClientAdapter as IOHttpClientAdapter).onHttpClientCreate =
        (HttpClient client) {
      client.badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
      return client;
    };
  }

  dio.interceptors.addAll(interceptors);
  dio.interceptors
      .add(LogInterceptor(requestBody: kDebugMode, responseBody: kDebugMode));

  return dio;
}
