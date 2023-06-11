import 'package:flutter/widgets.dart';
import 'package:package_info_plus/package_info_plus.dart';

enum Environment {
  development,
  production,
}

class EnvConfig {
  EnvConfig._();
  
  late final Environment env;
  late final String appName;
  late final String packageName;
  late final String version;
  late final String buildNumber;

  bool get isDev => env == Environment.development;
  bool get isProd => env == Environment.production;

  static Future<EnvConfig> initEnv() async {
    final envConfig = EnvConfig._();
    var packageInfo = await PackageInfo.fromPlatform();
    envConfig.appName = packageInfo.appName;
    envConfig.packageName = packageInfo.packageName;
    envConfig.version = packageInfo.version;
    envConfig.buildNumber = packageInfo.buildNumber;

    if (envConfig.packageName.contains(".dev")) {
      envConfig.env = Environment.development;
      debugPrint("Running in Development Mode");
      return envConfig;
    }

    envConfig.env = Environment.production;
    debugPrint("Running in Production Mode");
    return envConfig;
  }

  String get versionPrint => '$appName v$version';
}