
import 'package:json_annotation/json_annotation.dart';

part 'city.g.dart';

@JsonSerializable()
class City {
  final String name;
  final String state;
  final String country;
  final double lat;
  final double lon;

  City({
    required this.name,
    required this.lat,
    required this.lon,
    this.state = "",
    this.country = "",
  });

  factory City.fromJson(Map<String, dynamic> json) => _$CityFromJson(json);
  Map<String, dynamic> toJson() => _$CityToJson(this);
}
