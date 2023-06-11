import 'package:flutter_base/config.dart';
import 'package:flutter_base/di.dart';

class BaseUrl {
  late final String base;

  BaseUrl({
    required String productionUrl,
    required String devUrl,
  }) {
    final envConfig = di<EnvConfig>();
    base = envConfig.isDev ? devUrl : productionUrl;
  }
}