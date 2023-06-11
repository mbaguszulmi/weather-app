import 'dart:async';

import 'dao/city_history_dao.dart';
import 'entity/city_history.dart';
import 'package:floor/floor.dart';
import 'package:sqflite/sqflite.dart' as sqflite;

part 'app_db.g.dart';

const dbName = "app_db.db";

@Database(version: 1, entities: [CityHistory])
abstract class AppDb extends FloorDatabase {
  CityHistoryDao get cityHistoryDao;
}
