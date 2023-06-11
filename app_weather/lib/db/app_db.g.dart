// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_db.dart';

// **************************************************************************
// FloorGenerator
// **************************************************************************

// ignore: avoid_classes_with_only_static_members
class $FloorAppDb {
  /// Creates a database builder for a persistent database.
  /// Once a database is built, you should keep a reference to it and re-use it.
  static _$AppDbBuilder databaseBuilder(String name) => _$AppDbBuilder(name);

  /// Creates a database builder for an in memory database.
  /// Information stored in an in memory database disappears when the process is killed.
  /// Once a database is built, you should keep a reference to it and re-use it.
  static _$AppDbBuilder inMemoryDatabaseBuilder() => _$AppDbBuilder(null);
}

class _$AppDbBuilder {
  _$AppDbBuilder(this.name);

  final String? name;

  final List<Migration> _migrations = [];

  Callback? _callback;

  /// Adds migrations to the builder.
  _$AppDbBuilder addMigrations(List<Migration> migrations) {
    _migrations.addAll(migrations);
    return this;
  }

  /// Adds a database [Callback] to the builder.
  _$AppDbBuilder addCallback(Callback callback) {
    _callback = callback;
    return this;
  }

  /// Creates the database and initializes it.
  Future<AppDb> build() async {
    final path = name != null
        ? await sqfliteDatabaseFactory.getDatabasePath(name!)
        : ':memory:';
    final database = _$AppDb();
    database.database = await database.open(
      path,
      _migrations,
      _callback,
    );
    return database;
  }
}

class _$AppDb extends AppDb {
  _$AppDb([StreamController<String>? listener]) {
    changeListener = listener ?? StreamController<String>.broadcast();
  }

  CityHistoryDao? _cityHistoryDaoInstance;

  Future<sqflite.Database> open(
    String path,
    List<Migration> migrations, [
    Callback? callback,
  ]) async {
    final databaseOptions = sqflite.OpenDatabaseOptions(
      version: 1,
      onConfigure: (database) async {
        await database.execute('PRAGMA foreign_keys = ON');
        await callback?.onConfigure?.call(database);
      },
      onOpen: (database) async {
        await callback?.onOpen?.call(database);
      },
      onUpgrade: (database, startVersion, endVersion) async {
        await MigrationAdapter.runMigrations(
            database, startVersion, endVersion, migrations);

        await callback?.onUpgrade?.call(database, startVersion, endVersion);
      },
      onCreate: (database, version) async {
        await database.execute(
            'CREATE TABLE IF NOT EXISTS `CityHistory` (`id` INTEGER NOT NULL, `name` TEXT NOT NULL, `lat` REAL NOT NULL, `lon` REAL NOT NULL, `date` INTEGER NOT NULL, PRIMARY KEY (`id`))');

        await callback?.onCreate?.call(database, version);
      },
    );
    return sqfliteDatabaseFactory.openDatabase(path, options: databaseOptions);
  }

  @override
  CityHistoryDao get cityHistoryDao {
    return _cityHistoryDaoInstance ??=
        _$CityHistoryDao(database, changeListener);
  }
}

class _$CityHistoryDao extends CityHistoryDao {
  _$CityHistoryDao(
    this.database,
    this.changeListener,
  )   : _queryAdapter = QueryAdapter(database, changeListener),
        _cityHistoryInsertionAdapter = InsertionAdapter(
            database,
            'CityHistory',
            (CityHistory item) => <String, Object?>{
                  'id': item.id,
                  'name': item.name,
                  'lat': item.lat,
                  'lon': item.lon,
                  'date': item.date
                },
            changeListener);

  final sqflite.DatabaseExecutor database;

  final StreamController<String> changeListener;

  final QueryAdapter _queryAdapter;

  final InsertionAdapter<CityHistory> _cityHistoryInsertionAdapter;

  @override
  Stream<List<CityHistory>> getCityHistories() {
    return _queryAdapter.queryListStream(
        'SELECT * FROM CityHistory ORDER BY date DESC LIMIT 5',
        mapper: (Map<String, Object?> row) => CityHistory(
            row['id'] as int,
            row['name'] as String,
            row['lat'] as double,
            row['lon'] as double,
            row['date'] as int),
        queryableName: 'CityHistory',
        isView: false);
  }

  @override
  Future<void> insertCityHistory(CityHistory cityHistory) async {
    await _cityHistoryInsertionAdapter.insert(
        cityHistory, OnConflictStrategy.replace);
  }
}
