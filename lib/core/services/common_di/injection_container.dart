import 'package:flutter_weather_app/weather/home/injection_container.dart';
import 'package:flutter_weather_app/weather/splash/injection_container.dart';

Future<void> initCommon() async {
  await initSplashDI();
  await initHomeDI();
}