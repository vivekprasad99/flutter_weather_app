import 'package:flutter_weather_app/core/error/failure.dart';
import 'package:flutter_weather_app/core/usecases/usecases.dart';
import 'package:flutter_weather_app/weather/home/data/models/weather_model.dart';
import 'package:flutter_weather_app/weather/home/domain/repositories/home_repositories.dart';
import 'package:dartz/dartz.dart';

class HomeUsecase implements UseCases<WeatherModel, String> {
  const HomeUsecase({
    required this.homeRepositories,
  });

  final HomeRepositories homeRepositories;
  @override
  Future<Either<Failure, WeatherModel>> call(String cityName) {
    return homeRepositories.getWeatherData(cityName);
  }
}
