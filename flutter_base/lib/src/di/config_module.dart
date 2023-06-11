import 'package:flutter_base/di.dart';
import 'package:flutter_base/src/config/env_config.dart';

void initializeConfigModule() {
  di.registerSingletonAsync<EnvConfig>(() async {
    return await EnvConfig.initEnv();
  });
}