extension TempExtension on double {
  String get celsius => "${(this - 273.15).round()}°";
  String get celsiusNoDegree => "${(this - 273.15).round()}";
}

extension WeatherStringExtension on String {
  String get weatherIcon => "https://openweathermap.org/img/wn/$this@2x.png";
}
