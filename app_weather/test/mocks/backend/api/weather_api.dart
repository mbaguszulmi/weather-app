import 'dart:convert';

import 'package:app_weather/backend/api/weather_api.dart';
import 'package:app_weather/backend/models/response/current_weather.dart';
import 'package:app_weather/backend/models/response/daily_weather.dart';
import 'package:app_weather/model/city.dart';

class MyWeatherApi implements WeatherApi {
  @override
  Future<List<City>> findCity(String query, {int limit = 5}) {
    return Future.delayed(
      const Duration(seconds: 1),
      () => [
        City(
            name: "Malang",
            lat: -7.9666,
            lon: 112.6326,
            state: "East Java",
            country: "ID"),
        City(
            name: "Surabaya",
            lat: -7.2575,
            lon: 112.7521,
            state: "East Java",
            country: "ID"),
        City(
            name: "Jakarta",
            lat: -6.2088,
            lon: 106.8456,
            state: "Special Region of Jakarta",
            country: "ID"),
      ],
    );
  }

  @override
  Future<CurrentWeather> getCurrentWeather(double lat, double lon) {
    return Future.delayed(
      const Duration(seconds: 1),
      () => CurrentWeather.fromJson(
        jsonDecode(
          """{"coord":{"lon":112.634,"lat":-7.9771},"weather":[{"id":804,"main":"Clouds","description":"overcast clouds","icon":"04n"}],"base":"stations","main":{"temp":294.6,"feels_like":295.33,"temp_min":294.6,"temp_max":294.6,"pressure":1013,"humidity":97,"sea_level":1013,"grnd_level":962},"visibility":10000,"wind":{"speed":0.56,"deg":139,"gust":0.87},"clouds":{"all":96},"dt":1686505312,"sys":{"country":"ID","sunrise":1686523160,"sunset":1686565152},"timezone":25200,"id":1636722,"name":"Malang","cod":200}""",
        ),
      ),
    );
  }

  @override
  Future<DailyWeather> getDailyWeather(double lat, double lon) {
    return Future.delayed(
      const Duration(seconds: 1),
      () => DailyWeather.fromJson(
        jsonDecode(
          """{
            "cod": "200",
            "message": 0,
            "cnt": 40,
            "list": [
                {
                    "dt": 1686506400,
                    "main": {
                        "temp": 294.51,
                        "feels_like": 295.23,
                        "temp_min": 294.51,
                        "temp_max": 294.51,
                        "pressure": 1013,
                        "sea_level": 1013,
                        "grnd_level": 960,
                        "humidity": 97,
                        "temp_kf": 0
                    },
                    "weather": [
                        {
                            "id": 500,
                            "main": "Rain",
                            "description": "light rain",
                            "icon": "10n"
                        }
                    ],
                    "clouds": {
                        "all": 95
                    },
                    "wind": {
                        "speed": 0.55,
                        "deg": 145,
                        "gust": 0.91
                    },
                    "visibility": 10000,
                    "pop": 0.51,
                    "rain": {
                        "3h": 0.79
                    },
                    "sys": {
                        "pod": "n"
                    },
                    "dt_txt": "2023-06-11 18:00:00"
                },
                {
                    "dt": 1686517200,
                    "main": {
                        "temp": 294.46,
                        "feels_like": 295.15,
                        "temp_min": 294.37,
                        "temp_max": 294.46,
                        "pressure": 1013,
                        "sea_level": 1013,
                        "grnd_level": 960,
                        "humidity": 96,
                        "temp_kf": 0.09
                    },
                    "weather": [
                        {
                            "id": 500,
                            "main": "Rain",
                            "description": "light rain",
                            "icon": "10n"
                        }
                    ],
                    "clouds": {
                        "all": 97
                    },
                    "wind": {
                        "speed": 0.47,
                        "deg": 114,
                        "gust": 0.96
                    },
                    "visibility": 10000,
                    "pop": 0.23,
                    "rain": {
                        "3h": 0.29
                    },
                    "sys": {
                        "pod": "n"
                    },
                    "dt_txt": "2023-06-11 21:00:00"
                },
                {
                    "dt": 1686528000,
                    "main": {
                        "temp": 295.75,
                        "feels_like": 296.44,
                        "temp_min": 295.75,
                        "temp_max": 296.37,
                        "pressure": 1014,
                        "sea_level": 1014,
                        "grnd_level": 962,
                        "humidity": 91,
                        "temp_kf": -0.62
                    },
                    "weather": [
                        {
                            "id": 804,
                            "main": "Clouds",
                            "description": "overcast clouds",
                            "icon": "04d"
                        }
                    ],
                    "clouds": {
                        "all": 98
                    },
                    "wind": {
                        "speed": 0.5,
                        "deg": 51,
                        "gust": 1.02
                    },
                    "visibility": 10000,
                    "pop": 0.13,
                    "sys": {
                        "pod": "d"
                    },
                    "dt_txt": "2023-06-12 00:00:00"
                },
                {
                    "dt": 1686538800,
                    "main": {
                        "temp": 301.74,
                        "feels_like": 304.22,
                        "temp_min": 301.74,
                        "temp_max": 301.74,
                        "pressure": 1013,
                        "sea_level": 1013,
                        "grnd_level": 962,
                        "humidity": 65,
                        "temp_kf": 0
                    },
                    "weather": [
                        {
                            "id": 500,
                            "main": "Rain",
                            "description": "light rain",
                            "icon": "10d"
                        }
                    ],
                    "clouds": {
                        "all": 80
                    },
                    "wind": {
                        "speed": 0.19,
                        "deg": 278,
                        "gust": 1.43
                    },
                    "visibility": 10000,
                    "pop": 0.3,
                    "rain": {
                        "3h": 0.27
                    },
                    "sys": {
                        "pod": "d"
                    },
                    "dt_txt": "2023-06-12 03:00:00"
                },
                {
                    "dt": 1686549600,
                    "main": {
                        "temp": 300.56,
                        "feels_like": 303.48,
                        "temp_min": 300.56,
                        "temp_max": 300.56,
                        "pressure": 1010,
                        "sea_level": 1010,
                        "grnd_level": 959,
                        "humidity": 77,
                        "temp_kf": 0
                    },
                    "weather": [
                        {
                            "id": 501,
                            "main": "Rain",
                            "description": "moderate rain",
                            "icon": "10d"
                        }
                    ],
                    "clouds": {
                        "all": 87
                    },
                    "wind": {
                        "speed": 0.15,
                        "deg": 147,
                        "gust": 0.73
                    },
                    "visibility": 7518,
                    "pop": 0.45,
                    "rain": {
                        "3h": 3.55
                    },
                    "sys": {
                        "pod": "d"
                    },
                    "dt_txt": "2023-06-12 06:00:00"
                },
                {
                    "dt": 1686560400,
                    "main": {
                        "temp": 298.5,
                        "feels_like": 299.41,
                        "temp_min": 298.5,
                        "temp_max": 298.5,
                        "pressure": 1010,
                        "sea_level": 1010,
                        "grnd_level": 959,
                        "humidity": 89,
                        "temp_kf": 0
                    },
                    "weather": [
                        {
                            "id": 501,
                            "main": "Rain",
                            "description": "moderate rain",
                            "icon": "10d"
                        }
                    ],
                    "clouds": {
                        "all": 81
                    },
                    "wind": {
                        "speed": 0.67,
                        "deg": 172,
                        "gust": 1.11
                    },
                    "visibility": 8091,
                    "pop": 0.87,
                    "rain": {
                        "3h": 4.51
                    },
                    "sys": {
                        "pod": "d"
                    },
                    "dt_txt": "2023-06-12 09:00:00"
                },
                {
                    "dt": 1686571200,
                    "main": {
                        "temp": 295.68,
                        "feels_like": 296.55,
                        "temp_min": 295.68,
                        "temp_max": 295.68,
                        "pressure": 1013,
                        "sea_level": 1013,
                        "grnd_level": 961,
                        "humidity": 98,
                        "temp_kf": 0
                    },
                    "weather": [
                        {
                            "id": 500,
                            "main": "Rain",
                            "description": "light rain",
                            "icon": "10n"
                        }
                    ],
                    "clouds": {
                        "all": 80
                    },
                    "wind": {
                        "speed": 0.48,
                        "deg": 152,
                        "gust": 1.09
                    },
                    "visibility": 6614,
                    "pop": 0.95,
                    "rain": {
                        "3h": 1.62
                    },
                    "sys": {
                        "pod": "n"
                    },
                    "dt_txt": "2023-06-12 12:00:00"
                },
                {
                    "dt": 1686582000,
                    "main": {
                        "temp": 295.18,
                        "feels_like": 296,
                        "temp_min": 295.18,
                        "temp_max": 295.18,
                        "pressure": 1014,
                        "sea_level": 1014,
                        "grnd_level": 962,
                        "humidity": 98,
                        "temp_kf": 0
                    },
                    "weather": [
                        {
                            "id": 500,
                            "main": "Rain",
                            "description": "light rain",
                            "icon": "10n"
                        }
                    ],
                    "clouds": {
                        "all": 97
                    },
                    "wind": {
                        "speed": 0.8,
                        "deg": 151,
                        "gust": 1.74
                    },
                    "visibility": 10000,
                    "pop": 0.85,
                    "rain": {
                        "3h": 1.29
                    },
                    "sys": {
                        "pod": "n"
                    },
                    "dt_txt": "2023-06-12 15:00:00"
                },
                {
                    "dt": 1686592800,
                    "main": {
                        "temp": 294.89,
                        "feels_like": 295.65,
                        "temp_min": 294.89,
                        "temp_max": 294.89,
                        "pressure": 1013,
                        "sea_level": 1013,
                        "grnd_level": 960,
                        "humidity": 97,
                        "temp_kf": 0
                    },
                    "weather": [
                        {
                            "id": 500,
                            "main": "Rain",
                            "description": "light rain",
                            "icon": "10n"
                        }
                    ],
                    "clouds": {
                        "all": 98
                    },
                    "wind": {
                        "speed": 0.48,
                        "deg": 158,
                        "gust": 0.98
                    },
                    "visibility": 9936,
                    "pop": 0.82,
                    "rain": {
                        "3h": 1.76
                    },
                    "sys": {
                        "pod": "n"
                    },
                    "dt_txt": "2023-06-12 18:00:00"
                },
                {
                    "dt": 1686603600,
                    "main": {
                        "temp": 294.42,
                        "feels_like": 295.11,
                        "temp_min": 294.42,
                        "temp_max": 294.42,
                        "pressure": 1012,
                        "sea_level": 1012,
                        "grnd_level": 960,
                        "humidity": 96,
                        "temp_kf": 0
                    },
                    "weather": [
                        {
                            "id": 500,
                            "main": "Rain",
                            "description": "light rain",
                            "icon": "10n"
                        }
                    ],
                    "clouds": {
                        "all": 99
                    },
                    "wind": {
                        "speed": 0.42,
                        "deg": 85,
                        "gust": 0.7
                    },
                    "visibility": 10000,
                    "pop": 0.3,
                    "rain": {
                        "3h": 0.13
                    },
                    "sys": {
                        "pod": "n"
                    },
                    "dt_txt": "2023-06-12 21:00:00"
                },
                {
                    "dt": 1686614400,
                    "main": {
                        "temp": 296.17,
                        "feels_like": 296.88,
                        "temp_min": 296.17,
                        "temp_max": 296.17,
                        "pressure": 1014,
                        "sea_level": 1014,
                        "grnd_level": 961,
                        "humidity": 90,
                        "temp_kf": 0
                    },
                    "weather": [
                        {
                            "id": 804,
                            "main": "Clouds",
                            "description": "overcast clouds",
                            "icon": "04d"
                        }
                    ],
                    "clouds": {
                        "all": 98
                    },
                    "wind": {
                        "speed": 0.4,
                        "deg": 71,
                        "gust": 0.9
                    },
                    "visibility": 10000,
                    "pop": 0.2,
                    "sys": {
                        "pod": "d"
                    },
                    "dt_txt": "2023-06-13 00:00:00"
                },
                {
                    "dt": 1686625200,
                    "main": {
                        "temp": 301.7,
                        "feels_like": 304.15,
                        "temp_min": 301.7,
                        "temp_max": 301.7,
                        "pressure": 1013,
                        "sea_level": 1013,
                        "grnd_level": 962,
                        "humidity": 65,
                        "temp_kf": 0
                    },
                    "weather": [
                        {
                            "id": 804,
                            "main": "Clouds",
                            "description": "overcast clouds",
                            "icon": "04d"
                        }
                    ],
                    "clouds": {
                        "all": 95
                    },
                    "wind": {
                        "speed": 0.66,
                        "deg": 234,
                        "gust": 1.42
                    },
                    "visibility": 10000,
                    "pop": 0,
                    "sys": {
                        "pod": "d"
                    },
                    "dt_txt": "2023-06-13 03:00:00"
                },
                {
                    "dt": 1686636000,
                    "main": {
                        "temp": 300.98,
                        "feels_like": 303.49,
                        "temp_min": 300.98,
                        "temp_max": 300.98,
                        "pressure": 1010,
                        "sea_level": 1010,
                        "grnd_level": 959,
                        "humidity": 70,
                        "temp_kf": 0
                    },
                    "weather": [
                        {
                            "id": 500,
                            "main": "Rain",
                            "description": "light rain",
                            "icon": "10d"
                        }
                    ],
                    "clouds": {
                        "all": 94
                    },
                    "wind": {
                        "speed": 0.4,
                        "deg": 257,
                        "gust": 1.09
                    },
                    "visibility": 10000,
                    "pop": 0.4,
                    "rain": {
                        "3h": 0.74
                    },
                    "sys": {
                        "pod": "d"
                    },
                    "dt_txt": "2023-06-13 06:00:00"
                },
                {
                    "dt": 1686646800,
                    "main": {
                        "temp": 298.65,
                        "feels_like": 299.53,
                        "temp_min": 298.65,
                        "temp_max": 298.65,
                        "pressure": 1011,
                        "sea_level": 1011,
                        "grnd_level": 959,
                        "humidity": 87,
                        "temp_kf": 0
                    },
                    "weather": [
                        {
                            "id": 500,
                            "main": "Rain",
                            "description": "light rain",
                            "icon": "10d"
                        }
                    ],
                    "clouds": {
                        "all": 97
                    },
                    "wind": {
                        "speed": 0.15,
                        "deg": 148,
                        "gust": 1.45
                    },
                    "visibility": 10000,
                    "pop": 0.46,
                    "rain": {
                        "3h": 1.55
                    },
                    "sys": {
                        "pod": "d"
                    },
                    "dt_txt": "2023-06-13 09:00:00"
                },
                {
                    "dt": 1686657600,
                    "main": {
                        "temp": 295.62,
                        "feels_like": 296.48,
                        "temp_min": 295.62,
                        "temp_max": 295.62,
                        "pressure": 1013,
                        "sea_level": 1013,
                        "grnd_level": 961,
                        "humidity": 98,
                        "temp_kf": 0
                    },
                    "weather": [
                        {
                            "id": 500,
                            "main": "Rain",
                            "description": "light rain",
                            "icon": "10n"
                        }
                    ],
                    "clouds": {
                        "all": 97
                    },
                    "wind": {
                        "speed": 0.5,
                        "deg": 142,
                        "gust": 1.05
                    },
                    "visibility": 10000,
                    "pop": 0.4,
                    "rain": {
                        "3h": 0.18
                    },
                    "sys": {
                        "pod": "n"
                    },
                    "dt_txt": "2023-06-13 12:00:00"
                },
                {
                    "dt": 1686668400,
                    "main": {
                        "temp": 295.36,
                        "feels_like": 296.14,
                        "temp_min": 295.36,
                        "temp_max": 295.36,
                        "pressure": 1014,
                        "sea_level": 1014,
                        "grnd_level": 961,
                        "humidity": 96,
                        "temp_kf": 0
                    },
                    "weather": [
                        {
                            "id": 804,
                            "main": "Clouds",
                            "description": "overcast clouds",
                            "icon": "04n"
                        }
                    ],
                    "clouds": {
                        "all": 94
                    },
                    "wind": {
                        "speed": 0.85,
                        "deg": 149,
                        "gust": 1.92
                    },
                    "visibility": 10000,
                    "pop": 0.04,
                    "sys": {
                        "pod": "n"
                    },
                    "dt_txt": "2023-06-13 15:00:00"
                },
                {
                    "dt": 1686679200,
                    "main": {
                        "temp": 294.46,
                        "feels_like": 295.15,
                        "temp_min": 294.46,
                        "temp_max": 294.46,
                        "pressure": 1012,
                        "sea_level": 1012,
                        "grnd_level": 960,
                        "humidity": 96,
                        "temp_kf": 0
                    },
                    "weather": [
                        {
                            "id": 803,
                            "main": "Clouds",
                            "description": "broken clouds",
                            "icon": "04n"
                        }
                    ],
                    "clouds": {
                        "all": 81
                    },
                    "wind": {
                        "speed": 0.71,
                        "deg": 141,
                        "gust": 1.14
                    },
                    "visibility": 10000,
                    "pop": 0.04,
                    "sys": {
                        "pod": "n"
                    },
                    "dt_txt": "2023-06-13 18:00:00"
                },
                {
                    "dt": 1686690000,
                    "main": {
                        "temp": 294.12,
                        "feels_like": 294.7,
                        "temp_min": 294.12,
                        "temp_max": 294.12,
                        "pressure": 1012,
                        "sea_level": 1012,
                        "grnd_level": 960,
                        "humidity": 93,
                        "temp_kf": 0
                    },
                    "weather": [
                        {
                            "id": 804,
                            "main": "Clouds",
                            "description": "overcast clouds",
                            "icon": "04n"
                        }
                    ],
                    "clouds": {
                        "all": 91
                    },
                    "wind": {
                        "speed": 0.68,
                        "deg": 90,
                        "gust": 0.88
                    },
                    "visibility": 10000,
                    "pop": 0,
                    "sys": {
                        "pod": "n"
                    },
                    "dt_txt": "2023-06-13 21:00:00"
                },
                {
                    "dt": 1686700800,
                    "main": {
                        "temp": 295.59,
                        "feels_like": 296.19,
                        "temp_min": 295.59,
                        "temp_max": 295.59,
                        "pressure": 1014,
                        "sea_level": 1014,
                        "grnd_level": 961,
                        "humidity": 88,
                        "temp_kf": 0
                    },
                    "weather": [
                        {
                            "id": 803,
                            "main": "Clouds",
                            "description": "broken clouds",
                            "icon": "04d"
                        }
                    ],
                    "clouds": {
                        "all": 67
                    },
                    "wind": {
                        "speed": 0.56,
                        "deg": 154,
                        "gust": 1.12
                    },
                    "visibility": 10000,
                    "pop": 0,
                    "sys": {
                        "pod": "d"
                    },
                    "dt_txt": "2023-06-14 00:00:00"
                },
                {
                    "dt": 1686711600,
                    "main": {
                        "temp": 300.72,
                        "feels_like": 302.47,
                        "temp_min": 300.72,
                        "temp_max": 300.72,
                        "pressure": 1013,
                        "sea_level": 1013,
                        "grnd_level": 962,
                        "humidity": 65,
                        "temp_kf": 0
                    },
                    "weather": [
                        {
                            "id": 802,
                            "main": "Clouds",
                            "description": "scattered clouds",
                            "icon": "03d"
                        }
                    ],
                    "clouds": {
                        "all": 38
                    },
                    "wind": {
                        "speed": 0.93,
                        "deg": 223,
                        "gust": 1.71
                    },
                    "visibility": 10000,
                    "pop": 0,
                    "sys": {
                        "pod": "d"
                    },
                    "dt_txt": "2023-06-14 03:00:00"
                },
                {
                    "dt": 1686722400,
                    "main": {
                        "temp": 301.19,
                        "feels_like": 303.01,
                        "temp_min": 301.19,
                        "temp_max": 301.19,
                        "pressure": 1011,
                        "sea_level": 1011,
                        "grnd_level": 959,
                        "humidity": 63,
                        "temp_kf": 0
                    },
                    "weather": [
                        {
                            "id": 500,
                            "main": "Rain",
                            "description": "light rain",
                            "icon": "10d"
                        }
                    ],
                    "clouds": {
                        "all": 42
                    },
                    "wind": {
                        "speed": 0.98,
                        "deg": 178,
                        "gust": 1.27
                    },
                    "visibility": 10000,
                    "pop": 0.28,
                    "rain": {
                        "3h": 0.21
                    },
                    "sys": {
                        "pod": "d"
                    },
                    "dt_txt": "2023-06-14 06:00:00"
                },
                {
                    "dt": 1686733200,
                    "main": {
                        "temp": 298.11,
                        "feels_like": 298.85,
                        "temp_min": 298.11,
                        "temp_max": 298.11,
                        "pressure": 1011,
                        "sea_level": 1011,
                        "grnd_level": 960,
                        "humidity": 84,
                        "temp_kf": 0
                    },
                    "weather": [
                        {
                            "id": 500,
                            "main": "Rain",
                            "description": "light rain",
                            "icon": "10d"
                        }
                    ],
                    "clouds": {
                        "all": 85
                    },
                    "wind": {
                        "speed": 0.42,
                        "deg": 210,
                        "gust": 1.76
                    },
                    "visibility": 10000,
                    "pop": 0.44,
                    "rain": {
                        "3h": 0.93
                    },
                    "sys": {
                        "pod": "d"
                    },
                    "dt_txt": "2023-06-14 09:00:00"
                },
                {
                    "dt": 1686744000,
                    "main": {
                        "temp": 295.12,
                        "feels_like": 295.91,
                        "temp_min": 295.12,
                        "temp_max": 295.12,
                        "pressure": 1014,
                        "sea_level": 1014,
                        "grnd_level": 962,
                        "humidity": 97,
                        "temp_kf": 0
                    },
                    "weather": [
                        {
                            "id": 500,
                            "main": "Rain",
                            "description": "light rain",
                            "icon": "10n"
                        }
                    ],
                    "clouds": {
                        "all": 92
                    },
                    "wind": {
                        "speed": 0.57,
                        "deg": 157,
                        "gust": 0.96
                    },
                    "visibility": 10000,
                    "pop": 0.4,
                    "rain": {
                        "3h": 1.2
                    },
                    "sys": {
                        "pod": "n"
                    },
                    "dt_txt": "2023-06-14 12:00:00"
                },
                {
                    "dt": 1686754800,
                    "main": {
                        "temp": 294.75,
                        "feels_like": 295.47,
                        "temp_min": 294.75,
                        "temp_max": 294.75,
                        "pressure": 1014,
                        "sea_level": 1014,
                        "grnd_level": 962,
                        "humidity": 96,
                        "temp_kf": 0
                    },
                    "weather": [
                        {
                            "id": 500,
                            "main": "Rain",
                            "description": "light rain",
                            "icon": "10n"
                        }
                    ],
                    "clouds": {
                        "all": 100
                    },
                    "wind": {
                        "speed": 0.75,
                        "deg": 149,
                        "gust": 1.43
                    },
                    "visibility": 10000,
                    "pop": 0.24,
                    "rain": {
                        "3h": 0.32
                    },
                    "sys": {
                        "pod": "n"
                    },
                    "dt_txt": "2023-06-14 15:00:00"
                },
                {
                    "dt": 1686765600,
                    "main": {
                        "temp": 294.4,
                        "feels_like": 295.06,
                        "temp_min": 294.4,
                        "temp_max": 294.4,
                        "pressure": 1013,
                        "sea_level": 1013,
                        "grnd_level": 960,
                        "humidity": 95,
                        "temp_kf": 0
                    },
                    "weather": [
                        {
                            "id": 804,
                            "main": "Clouds",
                            "description": "overcast clouds",
                            "icon": "04n"
                        }
                    ],
                    "clouds": {
                        "all": 100
                    },
                    "wind": {
                        "speed": 0.52,
                        "deg": 161,
                        "gust": 0.94
                    },
                    "visibility": 10000,
                    "pop": 0,
                    "sys": {
                        "pod": "n"
                    },
                    "dt_txt": "2023-06-14 18:00:00"
                },
                {
                    "dt": 1686776400,
                    "main": {
                        "temp": 293.86,
                        "feels_like": 294.49,
                        "temp_min": 293.86,
                        "temp_max": 293.86,
                        "pressure": 1013,
                        "sea_level": 1013,
                        "grnd_level": 960,
                        "humidity": 96,
                        "temp_kf": 0
                    },
                    "weather": [
                        {
                            "id": 804,
                            "main": "Clouds",
                            "description": "overcast clouds",
                            "icon": "04n"
                        }
                    ],
                    "clouds": {
                        "all": 98
                    },
                    "wind": {
                        "speed": 0.65,
                        "deg": 144,
                        "gust": 1.16
                    },
                    "visibility": 10000,
                    "pop": 0,
                    "sys": {
                        "pod": "n"
                    },
                    "dt_txt": "2023-06-14 21:00:00"
                },
                {
                    "dt": 1686787200,
                    "main": {
                        "temp": 295.64,
                        "feels_like": 296.27,
                        "temp_min": 295.64,
                        "temp_max": 295.64,
                        "pressure": 1013,
                        "sea_level": 1013,
                        "grnd_level": 961,
                        "humidity": 89,
                        "temp_kf": 0
                    },
                    "weather": [
                        {
                            "id": 804,
                            "main": "Clouds",
                            "description": "overcast clouds",
                            "icon": "04d"
                        }
                    ],
                    "clouds": {
                        "all": 89
                    },
                    "wind": {
                        "speed": 0.31,
                        "deg": 62,
                        "gust": 0.95
                    },
                    "visibility": 10000,
                    "pop": 0.01,
                    "sys": {
                        "pod": "d"
                    },
                    "dt_txt": "2023-06-15 00:00:00"
                },
                {
                    "dt": 1686798000,
                    "main": {
                        "temp": 300.95,
                        "feels_like": 302.85,
                        "temp_min": 300.95,
                        "temp_max": 300.95,
                        "pressure": 1013,
                        "sea_level": 1013,
                        "grnd_level": 961,
                        "humidity": 65,
                        "temp_kf": 0
                    },
                    "weather": [
                        {
                            "id": 500,
                            "main": "Rain",
                            "description": "light rain",
                            "icon": "10d"
                        }
                    ],
                    "clouds": {
                        "all": 94
                    },
                    "wind": {
                        "speed": 0.64,
                        "deg": 264,
                        "gust": 2.08
                    },
                    "visibility": 10000,
                    "pop": 0.28,
                    "rain": {
                        "3h": 0.18
                    },
                    "sys": {
                        "pod": "d"
                    },
                    "dt_txt": "2023-06-15 03:00:00"
                },
                {
                    "dt": 1686808800,
                    "main": {
                        "temp": 299.35,
                        "feels_like": 299.35,
                        "temp_min": 299.35,
                        "temp_max": 299.35,
                        "pressure": 1011,
                        "sea_level": 1011,
                        "grnd_level": 959,
                        "humidity": 79,
                        "temp_kf": 0
                    },
                    "weather": [
                        {
                            "id": 500,
                            "main": "Rain",
                            "description": "light rain",
                            "icon": "10d"
                        }
                    ],
                    "clouds": {
                        "all": 97
                    },
                    "wind": {
                        "speed": 0.9,
                        "deg": 287,
                        "gust": 1.73
                    },
                    "visibility": 9593,
                    "pop": 0.44,
                    "rain": {
                        "3h": 2.52
                    },
                    "sys": {
                        "pod": "d"
                    },
                    "dt_txt": "2023-06-15 06:00:00"
                },
                {
                    "dt": 1686819600,
                    "main": {
                        "temp": 296.64,
                        "feels_like": 297.42,
                        "temp_min": 296.64,
                        "temp_max": 296.64,
                        "pressure": 1012,
                        "sea_level": 1012,
                        "grnd_level": 960,
                        "humidity": 91,
                        "temp_kf": 0
                    },
                    "weather": [
                        {
                            "id": 501,
                            "main": "Rain",
                            "description": "moderate rain",
                            "icon": "10d"
                        }
                    ],
                    "clouds": {
                        "all": 99
                    },
                    "wind": {
                        "speed": 0.66,
                        "deg": 239,
                        "gust": 1.83
                    },
                    "visibility": 8990,
                    "pop": 0.77,
                    "rain": {
                        "3h": 3.94
                    },
                    "sys": {
                        "pod": "d"
                    },
                    "dt_txt": "2023-06-15 09:00:00"
                },
                {
                    "dt": 1686830400,
                    "main": {
                        "temp": 294.46,
                        "feels_like": 295.18,
                        "temp_min": 294.46,
                        "temp_max": 294.46,
                        "pressure": 1014,
                        "sea_level": 1014,
                        "grnd_level": 962,
                        "humidity": 97,
                        "temp_kf": 0
                    },
                    "weather": [
                        {
                            "id": 500,
                            "main": "Rain",
                            "description": "light rain",
                            "icon": "10n"
                        }
                    ],
                    "clouds": {
                        "all": 92
                    },
                    "wind": {
                        "speed": 0.47,
                        "deg": 42,
                        "gust": 0.65
                    },
                    "visibility": 10000,
                    "pop": 0.78,
                    "rain": {
                        "3h": 0.98
                    },
                    "sys": {
                        "pod": "n"
                    },
                    "dt_txt": "2023-06-15 12:00:00"
                },
                {
                    "dt": 1686841200,
                    "main": {
                        "temp": 294.06,
                        "feels_like": 294.69,
                        "temp_min": 294.06,
                        "temp_max": 294.06,
                        "pressure": 1015,
                        "sea_level": 1015,
                        "grnd_level": 962,
                        "humidity": 95,
                        "temp_kf": 0
                    },
                    "weather": [
                        {
                            "id": 804,
                            "main": "Clouds",
                            "description": "overcast clouds",
                            "icon": "04n"
                        }
                    ],
                    "clouds": {
                        "all": 100
                    },
                    "wind": {
                        "speed": 0.6,
                        "deg": 81,
                        "gust": 0.91
                    },
                    "visibility": 10000,
                    "pop": 0.11,
                    "sys": {
                        "pod": "n"
                    },
                    "dt_txt": "2023-06-15 15:00:00"
                },
                {
                    "dt": 1686852000,
                    "main": {
                        "temp": 293.65,
                        "feels_like": 294.26,
                        "temp_min": 293.65,
                        "temp_max": 293.65,
                        "pressure": 1013,
                        "sea_level": 1013,
                        "grnd_level": 961,
                        "humidity": 96,
                        "temp_kf": 0
                    },
                    "weather": [
                        {
                            "id": 804,
                            "main": "Clouds",
                            "description": "overcast clouds",
                            "icon": "04n"
                        }
                    ],
                    "clouds": {
                        "all": 100
                    },
                    "wind": {
                        "speed": 0.56,
                        "deg": 88,
                        "gust": 0.95
                    },
                    "visibility": 10000,
                    "pop": 0.01,
                    "sys": {
                        "pod": "n"
                    },
                    "dt_txt": "2023-06-15 18:00:00"
                },
                {
                    "dt": 1686862800,
                    "main": {
                        "temp": 293.62,
                        "feels_like": 294.2,
                        "temp_min": 293.62,
                        "temp_max": 293.62,
                        "pressure": 1013,
                        "sea_level": 1013,
                        "grnd_level": 960,
                        "humidity": 95,
                        "temp_kf": 0
                    },
                    "weather": [
                        {
                            "id": 804,
                            "main": "Clouds",
                            "description": "overcast clouds",
                            "icon": "04n"
                        }
                    ],
                    "clouds": {
                        "all": 100
                    },
                    "wind": {
                        "speed": 0.52,
                        "deg": 116,
                        "gust": 0.8
                    },
                    "visibility": 10000,
                    "pop": 0.04,
                    "sys": {
                        "pod": "n"
                    },
                    "dt_txt": "2023-06-15 21:00:00"
                },
                {
                    "dt": 1686873600,
                    "main": {
                        "temp": 295.17,
                        "feels_like": 295.8,
                        "temp_min": 295.17,
                        "temp_max": 295.17,
                        "pressure": 1014,
                        "sea_level": 1014,
                        "grnd_level": 962,
                        "humidity": 91,
                        "temp_kf": 0
                    },
                    "weather": [
                        {
                            "id": 804,
                            "main": "Clouds",
                            "description": "overcast clouds",
                            "icon": "04d"
                        }
                    ],
                    "clouds": {
                        "all": 100
                    },
                    "wind": {
                        "speed": 0.75,
                        "deg": 33,
                        "gust": 1.14
                    },
                    "visibility": 10000,
                    "pop": 0.04,
                    "sys": {
                        "pod": "d"
                    },
                    "dt_txt": "2023-06-16 00:00:00"
                },
                {
                    "dt": 1686884400,
                    "main": {
                        "temp": 299.69,
                        "feels_like": 299.69,
                        "temp_min": 299.69,
                        "temp_max": 299.69,
                        "pressure": 1013,
                        "sea_level": 1013,
                        "grnd_level": 962,
                        "humidity": 70,
                        "temp_kf": 0
                    },
                    "weather": [
                        {
                            "id": 804,
                            "main": "Clouds",
                            "description": "overcast clouds",
                            "icon": "04d"
                        }
                    ],
                    "clouds": {
                        "all": 100
                    },
                    "wind": {
                        "speed": 0.29,
                        "deg": 274,
                        "gust": 1.54
                    },
                    "visibility": 10000,
                    "pop": 0.02,
                    "sys": {
                        "pod": "d"
                    },
                    "dt_txt": "2023-06-16 03:00:00"
                },
                {
                    "dt": 1686895200,
                    "main": {
                        "temp": 299.74,
                        "feels_like": 299.74,
                        "temp_min": 299.74,
                        "temp_max": 299.74,
                        "pressure": 1011,
                        "sea_level": 1011,
                        "grnd_level": 959,
                        "humidity": 74,
                        "temp_kf": 0
                    },
                    "weather": [
                        {
                            "id": 500,
                            "main": "Rain",
                            "description": "light rain",
                            "icon": "10d"
                        }
                    ],
                    "clouds": {
                        "all": 100
                    },
                    "wind": {
                        "speed": 1.5,
                        "deg": 320,
                        "gust": 2.21
                    },
                    "visibility": 10000,
                    "pop": 0.28,
                    "rain": {
                        "3h": 1.24
                    },
                    "sys": {
                        "pod": "d"
                    },
                    "dt_txt": "2023-06-16 06:00:00"
                },
                {
                    "dt": 1686906000,
                    "main": {
                        "temp": 296.63,
                        "feels_like": 297.41,
                        "temp_min": 296.63,
                        "temp_max": 296.63,
                        "pressure": 1011,
                        "sea_level": 1011,
                        "grnd_level": 959,
                        "humidity": 91,
                        "temp_kf": 0
                    },
                    "weather": [
                        {
                            "id": 500,
                            "main": "Rain",
                            "description": "light rain",
                            "icon": "10d"
                        }
                    ],
                    "clouds": {
                        "all": 99
                    },
                    "wind": {
                        "speed": 0.5,
                        "deg": 337,
                        "gust": 1.48
                    },
                    "visibility": 10000,
                    "pop": 0.76,
                    "rain": {
                        "3h": 2.81
                    },
                    "sys": {
                        "pod": "d"
                    },
                    "dt_txt": "2023-06-16 09:00:00"
                },
                {
                    "dt": 1686916800,
                    "main": {
                        "temp": 294.95,
                        "feels_like": 295.69,
                        "temp_min": 294.95,
                        "temp_max": 294.95,
                        "pressure": 1014,
                        "sea_level": 1014,
                        "grnd_level": 961,
                        "humidity": 96,
                        "temp_kf": 0
                    },
                    "weather": [
                        {
                            "id": 501,
                            "main": "Rain",
                            "description": "moderate rain",
                            "icon": "10n"
                        }
                    ],
                    "clouds": {
                        "all": 100
                    },
                    "wind": {
                        "speed": 0.76,
                        "deg": 28,
                        "gust": 0.98
                    },
                    "visibility": 10000,
                    "pop": 0.79,
                    "rain": {
                        "3h": 3.01
                    },
                    "sys": {
                        "pod": "n"
                    },
                    "dt_txt": "2023-06-16 12:00:00"
                },
                {
                    "dt": 1686927600,
                    "main": {
                        "temp": 294.9,
                        "feels_like": 295.61,
                        "temp_min": 294.9,
                        "temp_max": 294.9,
                        "pressure": 1015,
                        "sea_level": 1015,
                        "grnd_level": 962,
                        "humidity": 95,
                        "temp_kf": 0
                    },
                    "weather": [
                        {
                            "id": 500,
                            "main": "Rain",
                            "description": "light rain",
                            "icon": "10n"
                        }
                    ],
                    "clouds": {
                        "all": 100
                    },
                    "wind": {
                        "speed": 0.17,
                        "deg": 129,
                        "gust": 0.65
                    },
                    "visibility": 10000,
                    "pop": 0.47,
                    "rain": {
                        "3h": 0.9
                    },
                    "sys": {
                        "pod": "n"
                    },
                    "dt_txt": "2023-06-16 15:00:00"
                }
            ],
            "city": {
                "id": 1636722,
                "name": "Malang",
                "coord": {
                    "lat": -7.9666,
                    "lon": 112.6326
                },
                "country": "ID",
                "population": 746716,
                "timezone": 25200,
                "sunrise": 1686523159,
                "sunset": 1686565154
            }
        }""",
        ),
      ),
    );
  }
}
