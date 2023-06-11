import 'package:dio/dio.dart';
import 'package:flutter_backend/src/config/dio_config.dart';
import 'package:flutter_backend/src/constants/api.dart';
import 'package:flutter_backend/src/di/qualifiers.dart';
import 'package:flutter_base/di.dart';
import 'package:get_it/get_it.dart';

void initializeBackendModule() {
  for (var qualifier in dioClientQualifiers) {
    di.registerSingletonWithDependencies(
      () => generateDioClient(qualifier),
      dependsOn: [
        BaseUrl,
        InitDependency(Interceptors, instanceName: qualifier),
      ],
      instanceName: qualifier,
    );
  }
}
