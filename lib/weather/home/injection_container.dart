
import 'package:flutter_weather_app/core/services/di/injection_container.dart';
import 'package:flutter_weather_app/weather/home/data/datasource/home_datasource.dart';
import 'package:flutter_weather_app/weather/home/data/models/weather_model.dart';
import 'package:flutter_weather_app/weather/home/data/repositories/home_repositories.dart';
import 'package:flutter_weather_app/weather/home/domain/repositories/home_repositories.dart';
import 'package:flutter_weather_app/weather/home/domain/usecases/home_usecase.dart';
import 'package:flutter_weather_app/weather/home/presentation/cubit/home_cubit.dart';

Future<void> initHomeDI() async {
  di.registerFactory(() => HomeDatasource(dio: di()));
  di.registerFactory<HomeRepositories>(() => HomeRepositoriesImpl(datasource: di()));
  di.registerFactory(() => HomeUsecase( homeRepositories: di()));
  di.registerFactory(() => WeatherModel());
  di.registerFactory(() => HomeCubit(useCase: di()));
}