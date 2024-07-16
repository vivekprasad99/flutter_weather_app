import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_weather_app/core/error/failure.dart';
import 'package:flutter_weather_app/weather/home/data/models/weather_model.dart';
import 'package:flutter_weather_app/weather/home/domain/usecases/home_usecase.dart';
import 'package:meta/meta.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  final HomeUsecase useCase;

  HomeCubit({required this.useCase}) : super(HomeInitial()) {
    getWeatherData("Mumbai");
  }

  void getWeatherData(String cityName) async {
    try {
      emit(LoadingState(isloading: true));
      final result = await useCase.call(cityName);
      emit(LoadingState(isloading: false));
      result.fold((l) => emit(WeatherFailureState(failure: l)),
          (r) => emit(WeatherSuccessState(weatherModel: r)));
    } catch (e) {
      emit(LoadingState(isloading: false));
      emit(WeatherFailureState(failure: Failure(message: e.toString())));
    }
  }
}
