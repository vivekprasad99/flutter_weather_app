import 'package:dio/dio.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_weather_app/core/error/failure.dart';
import 'package:flutter_weather_app/weather/home/data/models/weather_model.dart';
import 'package:flutter_weather_app/weather/home/data/network/api_endpoints.dart';

class HomeDatasource {
  const HomeDatasource({
    required this.dio,
  });

  final Dio dio;

  @override
  Future<Either<Failure, WeatherModel>> getWeatherData(String cityName) async {
    try {
      final String? apiKeys = dotenv.env["Api_Key"];
      final response = await dio.get(baseUrl, queryParameters: {
        "q": cityName,
        "appid": apiKeys
      });
      if (response.statusCode == 200) {
        return Right(
          WeatherModel.fromJson(response.data as Map<String, dynamic>),
        );
      } else {
        return Left(
          Failure(message: response.toString()),
        );
      }
    } on DioException catch (e) {
      return Left(
        Failure(message: e.response?.data['message']),
      );
    }
  }
}




