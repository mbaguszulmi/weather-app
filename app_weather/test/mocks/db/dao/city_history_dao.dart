import 'package:app_weather/db/dao/city_history_dao.dart';
import 'package:app_weather/db/entity/city_history.dart';

class MyCityHistoryDao implements CityHistoryDao {
  @override
  Stream<List<CityHistory>> getCityHistories() {
    return Stream.value([
      CityHistory(
        0,
        "Malang",
        -7.9666,
        112.6326,
        1686506031030,
      ),
      CityHistory(
        0,
        "Surabaya",
        -7.2575,
        112.7521,
        1686506031030,
      ),
      CityHistory(
        0,
        "Jakarta",
        -6.2088,
        106.8456,
        1686506031030,
      ),
    ]);
  }

  @override
  Future<void> insertCityHistory(CityHistory cityHistory) async {}
}
