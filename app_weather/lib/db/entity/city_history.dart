import 'package:floor/floor.dart';

@entity
class CityHistory {
  @PrimaryKey()
  final int id;
  final String name;
  final double lat;
  final double lon;
  final int date;

  CityHistory(this.id, this.name, this.lat, this.lon, this.date);
}
