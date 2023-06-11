class CityDisplay {
  final int id;
  final String name;
  final String weatherCondition;
  final String temp;
  final String image;
  final String time;
  final double lat;
  final double lon;

  CityDisplay({
    required this.id,
    required this.name,
    this.weatherCondition = "-",
    this.temp = "-",
    this.image = "",
    this.time = "-",
    this.lat = 0,
    this.lon = 0,
  });
}
