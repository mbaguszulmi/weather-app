import 'package:app_weather/db/app_db.dart';
import 'package:flutter_base/di.dart';

void _provideDatabase() {
  di.registerSingletonAsync(() => $FloorAppDb.databaseBuilder(dbName).build());
}

void _provideCityHistoryDao() {
  di.registerSingletonWithDependencies(
    () => di<AppDb>().cityHistoryDao,
    dependsOn: [AppDb],
  );
}

void setupDbModule() {
  _provideDatabase();
  _provideCityHistoryDao();
}
