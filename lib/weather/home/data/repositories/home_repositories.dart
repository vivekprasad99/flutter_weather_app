import 'package:dartz/dartz.dart';
import 'package:flutter_weather_app/core/error/failure.dart';
import 'package:flutter_weather_app/weather/home/data/datasource/home_datasource.dart';
import 'package:flutter_weather_app/weather/home/data/models/weather_model.dart';
import 'package:flutter_weather_app/weather/home/domain/repositories/home_repositories.dart';

class HomeRepositoriesImpl implements HomeRepositories {
  const HomeRepositoriesImpl({required this.datasource});
  final HomeDatasource datasource;


  @override
  Future<Either<Failure, WeatherModel>> getWeatherData(String cityName) {
    return datasource.getWeatherData(cityName);
  }
}
