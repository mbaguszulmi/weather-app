import 'package:flutter/material.dart';

abstract class AppRouter {
  final Map<String, Widget Function(RouteSettings)> _routes;
  final String notFoundPath;

  AppRouter(this._routes, {this.notFoundPath = "/404"}) {
    initRoutes();
  }

  Map<String, Widget Function(RouteSettings)> get routes => _routes;

  void initRoutes() {}

  @protected
  void appendRoutes(AppRouter otherRouter) {
    var duplicateRoutesSet =
        otherRouter.routes.keys.toSet().intersection(_routes.keys.toSet());
    if (duplicateRoutesSet.isNotEmpty) {
      throw Exception(
          "Routes must be unique! There's duplicate routes $duplicateRoutesSet");
    }

    for (var path in otherRouter.routes.keys) {
      _routes[path] =
          (settings) => otherRouter.generatedRoute(settings);
    }
  }

  @protected
  Widget navigateWithBloc({required Widget child});

  Widget generatedRoute(RouteSettings settings) {
    if (routes.isEmpty) {
      throw Exception("Routes must be initialized before using them!");
    }

    if (settings.name == null) {
      throw Exception("Route name must be defined!");
    } else {
      final settingsUri = Uri.parse(settings.name ?? "");

      settings = RouteSettings(name: settingsUri.path, arguments: {
        ...(settings.arguments as Map<String, dynamic>? ?? {}),
        ...settingsUri.queryParameters,
      });
    }
    
    var widget = routes[settings.name]?.call(settings) ?? routes[notFoundPath]?.call(settings);
    if (widget == null) {
      throw Exception("Route not found: ${settings.name}");
    } else {
      return navigateWithBloc(child: widget);
    }
  }

  Route<dynamic> navigate(RouteSettings settings) {
    if (!routes.containsKey(notFoundPath)) {
      throw Exception("Not found path must be defined to handle 404!");
    }
    
    return MaterialPageRoute(
        settings: settings,
        builder: (context) => generatedRoute(settings),
      );
  }

  List<Route<dynamic>> buildInitialRoutes(String path) {
    return [
      navigate(RouteSettings(name: path))
    ];
  }
}