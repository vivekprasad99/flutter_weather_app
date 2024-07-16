
import 'package:flutter_weather_app/core/services/di/injection_container.dart';
import 'package:flutter_weather_app/weather/splash/presentation/cubit/splash_cubit.dart';

Future<void> initSplashDI() async {
  di.registerFactory(() => SplashCubit());
}