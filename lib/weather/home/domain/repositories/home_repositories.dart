import 'package:dartz/dartz.dart';
import 'package:flutter_weather_app/core/error/failure.dart';
import 'package:flutter_weather_app/weather/home/data/models/weather_model.dart';

abstract class HomeRepositories {
  Future<Either<Failure, WeatherModel>> getWeatherData(String cityName);
}