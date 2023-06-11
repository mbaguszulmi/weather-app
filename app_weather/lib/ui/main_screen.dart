import 'dart:async';

import 'package:app_weather/bloc/geocoding_bloc.dart';
import 'package:app_weather/bloc/weather_history_bloc.dart';
import 'package:app_weather/config/theme.dart';
import 'package:app_weather/router/app_router.dart';
import 'package:app_weather/ui/components/temperature_text.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

@RoutePage()
class MainScreen extends StatelessWidget implements AutoRouteWrapper {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const MainPage();
  }

  @override
  Widget wrappedRoute(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => GeocodingBloc()),
        BlocProvider(create: (context) => WeatherHistoryBloc()..init()),
      ],
      child: this,
    );
  }
}

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  final _searchController = TextEditingController();
  late final GeocodingBloc _geocodingBloc;
  bool _isSearching = false;
  Timer? _searchTimer;

  @override
  void initState() {
    super.initState();

    _geocodingBloc = context.read<GeocodingBloc>();

    _searchController.addListener(() {
      if (_searchController.text.trim().isNotEmpty) {
        if (_searchController.text.trim().length >= 3) {
          _search(_searchController.text);
        }

        setState(() {
          _isSearching = true;
        });
      } else {
        setState(() {
          _isSearching = false;
        });
        _geocodingBloc.reset();
      }
    });
  }

  void _search(String q) {
    _searchTimer?.cancel();

    _searchTimer = Timer(
      const Duration(seconds: 2),
      () => _geocodingBloc.searchCity(q),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Padding(
              padding: EdgeInsets.fromLTRB(20, 40, 20, 10),
              child: Text(
                "Weather",
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            const SizedBox(height: 20),
            _buildSearchBar(),
            BlocBuilder<GeocodingBloc, GeocodingState>(
              builder: (context, state) {
                return state is GeocodingFetched
                    ? _buildSearchItems(state)
                    : Expanded(
                        child: BlocBuilder<WeatherHistoryBloc,
                            WeatherHistoryState>(
                          builder: (context, historyState) {
                            return _buildSearchHistory(historyState);
                          },
                        ),
                      );
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSearchHistory(WeatherHistoryState historyState) {
    return historyState.cities.isEmpty
        ? Center(
            child: Text(
              "Your recent search will appear here",
              style: TextStyle(color: AppColors.grey[400]),
            ),
          )
        : ListView.builder(
            itemBuilder: (context, i) {
              final item = historyState.cities[i];

              return GestureDetector(
                onTap: () {
                  context.router.push(DetailRoute(
                    lat: item.lat,
                    lon: item.lon,
                  ));
                },
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 20,
                    vertical: 10,
                  ),
                  child: Container(
                    padding: const EdgeInsets.fromLTRB(20, 20, 36, 20),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(12),
                      boxShadow: [
                        BoxShadow(
                          offset: const Offset(0, 16),
                          blurRadius: 10.0,
                          color: Colors.black.withOpacity(0.1),
                        ),
                      ],
                    ),
                    child: Row(
                      children: [
                        Expanded(
                          flex: 1,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                item.name,
                                style: const TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                              item.image.isEmpty
                                  ? const SizedBox(height: 50)
                                  : Image.network(
                                      item.image,
                                      height: 50,
                                    ),
                              Text(item.weatherCondition),
                            ],
                          ),
                        ),
                        const SizedBox(width: 10),
                        Expanded(
                          flex: 1,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              TemperatureText(temperature: item.temp),
                              const SizedBox(height: 6),
                              Text(
                                item.time,
                                style: const TextStyle(
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              );
            },
            itemCount: historyState.cities.length,
          );
  }

  Widget _buildSearchBar() {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 20,
        vertical: 10,
      ),
      child: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(8),
              boxShadow: [
                BoxShadow(
                  offset: const Offset(0, 16),
                  blurRadius: 10.0,
                  color: Colors.black.withOpacity(0.1),
                ),
              ],
            ),
            clipBehavior: Clip.antiAlias,
            child: TextField(
              controller: _searchController,
              decoration: const InputDecoration(
                contentPadding: EdgeInsets.only(left: 24, right: 38),
                filled: true,
                fillColor: Colors.white,
                enabledBorder: InputBorder.none,
                hintText: "Search city",
              ),
            ),
          ),
          Positioned(
            top: 0,
            bottom: 0,
            right: 2,
            child: GestureDetector(
              onTap: _isSearching
                  ? () => setState(() {
                        _searchController.clear();
                      })
                  : null,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Icon(_isSearching ? Icons.clear : Icons.search),
              ),
            ),
          )
        ],
      ),
    );
  }

  Expanded _buildSearchItems(GeocodingFetched state) {
    return Expanded(
      child: state.cities.isEmpty
          ? Center(
              child: Text(
                "No cities found",
                style: TextStyle(color: AppColors.grey[400]),
              ),
            )
          : Padding(
              padding: const EdgeInsets.only(top: 20),
              child: ListView.builder(
                itemBuilder: (context, i) {
                  final item = state.cities[i];
                  return Column(
                    children: [
                      ListTile(
                        title: Text(item.cityText),
                        visualDensity: const VisualDensity(
                          vertical: -3,
                        ),
                        onTap: () {
                          context.router.push(DetailRoute(
                            lat: item.lat,
                            lon: item.lon,
                          ));
                          _searchController.clear();
                        },
                      ),
                      const Divider(
                        height: 1,
                      ),
                    ],
                  );
                },
                itemCount: state.cities.length,
              ),
            ),
    );
  }
}
