import 'package:app_weather/bloc/weather_bloc.dart';
import 'package:app_weather/model/weather_display.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'components/temperature_text.dart';

@RoutePage()
class DetailScreen extends StatelessWidget implements AutoRouteWrapper {
  final double lat;
  final double lon;

  const DetailScreen({super.key, required this.lat, required this.lon});

  @override
  Widget build(BuildContext context) {
    return DetailPage(lat: lat, lon: lon);
  }

  @override
  Widget wrappedRoute(BuildContext context) {
    return BlocProvider(
      create: (context) => WeatherBloc()..fetch(lat, lon),
      child: this,
    );
  }
}

class DetailPage extends StatefulWidget {
  final double lat;
  final double lon;
  const DetailPage({super.key, required this.lat, required this.lon});

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: BlocBuilder<WeatherBloc, WeatherState>(
          builder: (context, state) {
            final weather = state.weatherDisplay;

            return Column(
              children: [
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(20),
                      child: InkWell(
                        onTap: () => context.router.pop(),
                        borderRadius: BorderRadius.circular(20),
                        child: Container(
                          width: 40,
                          height: 40,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            boxShadow: [
                              BoxShadow(
                                offset: const Offset(0, 16),
                                blurRadius: 10.0,
                                color: Colors.black.withOpacity(0.1),
                              ),
                            ],
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: const Icon(Icons.chevron_left_rounded),
                        ),
                      ),
                    ),
                    Expanded(
                      child: Center(
                        child: Text(
                          weather.cityName,
                          style: const TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: 80),
                  ],
                ),
                weather.image.isEmpty
                    ? const SizedBox(height: 100)
                    : Container(
                        decoration: BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                              offset: const Offset(0, 5),
                              blurRadius: 50,
                              color: Colors.black.withOpacity(0.2),
                            ),
                          ],
                        ),
                        child: Image.network(
                          weather.image,
                          height: 100,
                        ),
                      ),
                TemperatureText(temperature: weather.temp),
                Text(weather.weatherCondition),
                const SizedBox(height: 6),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "H:${weather.tempMax}",
                      style: const TextStyle(
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    const SizedBox(width: 20),
                    Text(
                      "L:${weather.tempMin}",
                      style: const TextStyle(
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
                _build5DaysForecast(weather),
              ],
            );
          },
        ),
      ),
    );
  }

  Expanded _build5DaysForecast(WeatherDisplay weather) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                offset: const Offset(0, 16),
                blurRadius: 10.0,
                color: Colors.black.withOpacity(0.1),
              ),
            ],
            borderRadius: BorderRadius.circular(12),
          ),
          // width: double.infinity,
          padding: const EdgeInsets.symmetric(
            horizontal: 20,
            vertical: 20,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "5 days forecast",
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w500,
                  color: Colors.grey[700],
                ),
              ),
              const Divider(),
              Expanded(
                child: ListView.builder(
                  itemBuilder: (context, i) {
                    final item = weather.weather5DaysForecast[i];

                    return Column(
                      children: [
                        ListTile(
                          title: Row(
                            children: [
                              Expanded(
                                flex: 2,
                                child: Text(
                                  item.day,
                                  style: const TextStyle(
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ),
                              Expanded(
                                flex: 1,
                                child: Center(
                                  child: Image.network(
                                    item.image,
                                    height: 50,
                                  ),
                                ),
                              ),
                              Expanded(
                                flex: 1,
                                child: Text(
                                  "H:${item.tempMax}",
                                  textAlign: TextAlign.center,
                                  style: const TextStyle(
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ),
                              Expanded(
                                flex: 1,
                                child: Text(
                                  "L:${item.tempMin}",
                                  textAlign: TextAlign.center,
                                  style: const TextStyle(
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        const Divider(height: 1),
                      ],
                    );
                  },
                  itemCount: weather.weather5DaysForecast.length,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
