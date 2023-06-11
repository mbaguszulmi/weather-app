import 'package:app_weather/db/entity/city_history.dart';
import 'package:floor/floor.dart';

@dao
abstract class CityHistoryDao {
  @Insert(onConflict: OnConflictStrategy.replace)
  Future<void> insertCityHistory(CityHistory cityHistory);

  @Query("SELECT * FROM CityHistory ORDER BY date DESC LIMIT 5")
  Stream<List<CityHistory>> getCityHistories();
}