import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_weather_app/core/error/failure.dart';
import 'package:flutter_weather_app/weather/home/data/models/weather_model.dart';
import 'package:flutter_weather_app/weather/home/domain/usecases/home_usecase.dart';
import 'package:flutter_weather_app/weather/home/presentation/cubit/home_cubit.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:bloc_test/bloc_test.dart';

import 'home_cubit_test.mocks.dart';

@GenerateMocks([HomeUsecase])
void main() {
  late HomeCubit cubit;
  var mockHomeUseCase = MockHomeUsecase();
  late String mockRequest;
  late WeatherModel mockResponse;
  var mockError = const Failure(message: 'some error');


  setUp(() {
    TestWidgetsFlutterBinding.ensureInitialized();
    mockHomeUseCase = MockHomeUsecase();
    cubit = HomeCubit(useCase: mockHomeUseCase);
    mockRequest = "Mumbai";
    mockResponse = WeatherModel(
      coord: Coord(lon: 72.8479,lat: 19.0144),
      weather: [Weather(id: 701,main: "Mist",description: "mist",icon: "50n")],
      base: "stations",
      main: Main(temp: 300.14,feelsLike: 45,tempMin: 65,tempMax: 67,pressure: 6,humidity: 6,seaLevel: 65,grndLevel: 6),
      visibility: 56,
      wind: Wind(speed: 6,deg: 6),
      clouds: Clouds(all:8),
      dt: 7,
      sys: Sys(type: 6,id: 8,country: "in",sunrise: 78,sunset: 78),
      timezone: 88,
      id: 78,
      name: "8787",
      cod: 200
    );
  });

  group('test Weather API', () {
    blocTest(
        'should emit WeatherSuccessState when getWeatherData is called',
        build: () {
          when(mockHomeUseCase.call(mockRequest))
              .thenAnswer((_) async => Right(mockResponse));
          return cubit;
        },
        act: (HomeCubit cubit) {
          cubit.getWeatherData(mockRequest);
        },
        wait: const Duration(seconds: 1),
        expect: () =>
        [
          LoadingState(isloading: true),
          LoadingState(isloading: false),
          WeatherSuccessState(weatherModel: mockResponse)
        ]);
  });
}