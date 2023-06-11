import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import '../ui/detail_screen.dart';
import '../ui/main_screen.dart';

part 'app_router.gr.dart';

@AutoRouterConfig(replaceInRouteName: 'Screen,Route')
class AppRouter extends _$AppRouter {
  @override
  List<AutoRoute> get routes => [
        AutoRoute(
          path: "/main",
          page: MainRoute.page,
          initial: true,
        ),
        AutoRoute(
          path: "/detail",
          page: DetailRoute.page,
        )
      ];
}
