class WeatherDisplay {
  final int id;
  final String cityName;
  final String temp;
  final String weatherCondition;
  final String image;
  final String tempMin;
  final String tempMax;
  final List<WeatherForecast> weather5DaysForecast;

  const WeatherDisplay({
    required this.id,
    required this.cityName,
    required this.temp,
    required this.weatherCondition,
    required this.image,
    required this.tempMin,
    required this.tempMax,
    this.weather5DaysForecast = const [],
  });
}

class WeatherForecast {
  final String day;
  final String weatherCondition;
  final String image;
  final String tempMin;
  final String tempMax;
  final double tempMinValue;
  final double tempMaxValue;

  const WeatherForecast({
    required this.day,
    required this.weatherCondition,
    required this.image,
    required this.tempMin,
    required this.tempMax,
    required this.tempMinValue, 
    required this.tempMaxValue,
  });
}
