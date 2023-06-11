import 'package:app_weather/config/theme.dart';
import 'package:app_weather/router/app_router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_base/flutter_base.dart' hide AppRouter;
import 'package:flutter_bloc/flutter_bloc.dart';

import 'bloc/ui_bloc.dart';
import 'setup.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  FlutterBaseLib.setup();
  App.setup();
  await di.allReady();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  final _appRouter = AppRouter();

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      builder: (context, child) {
        return BlocConsumer<UiBloc, UiState>(
          bloc: di<UiBloc>(),
          listener: (context, state) {
            if (state is UiError) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(
                    state.error,
                    style: const TextStyle(
                      color: Colors.white,
                    ),
                  ),
                  backgroundColor: Colors.red[800],
                  showCloseIcon: true,
                ),
              );
            } else if (state is UiMessage) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(
                    state.message,
                  ),
                  showCloseIcon: true,
                ),
              );
            }
          },
          builder: (context, state) {
            return Stack(
              children: [
                child ?? const SizedBox(),
                ...(state is UiLoading
                    ? [
                        Container(
                          color: Colors.black.withOpacity(.7),
                          width: double.infinity,
                          height: double.infinity,
                          child: const Center(
                            child: CircularProgressIndicator(),
                          ),
                        )
                      ]
                    : [])
              ],
            );
          },
        );
      },
      debugShowCheckedModeBanner: false,
      routerConfig: _appRouter.config(),
      theme: appThemeLight,
      themeMode: ThemeMode.light,
    );
  }
}
