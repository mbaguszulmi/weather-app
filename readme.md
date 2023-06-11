# Flutter Weather App

Simple weather app with Open Weather API integrated. Modular, BLoC, Dependency Injection, and Auto route.

## How to run

1. Open `app_weather` folder in terminal
2. Run `flutter pub get` to get all dependencies.
3. Connect Mobile Android device
4. Run `flutter run`

## Modules

- flutter_base: Contains basic modules that have general use in flutter development
- flutter_backend: Contains everything we need to build a backend service (API)
- app_weather: Main module that contains UI, Bloc, API Implementation, and DB

## Testing

I've created a widget testing to test the main functionality. 
The main widget testing is in this file `app_weather/test/main_test.dart`.
1. Open `app_weather` folder in terminal
2. Run `flutter test`
