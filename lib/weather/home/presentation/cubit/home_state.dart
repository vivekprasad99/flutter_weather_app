part of 'home_cubit.dart';

@immutable
sealed class HomeState extends Equatable{}

class HomeInitial extends HomeState {
  @override
  List<Object?> get props => [];
}

class LoadingState extends HomeState {
  final bool isloading;

  LoadingState({required this.isloading});

  @override
  List<Object?> get props => [isloading];
}

class WeatherSuccessState extends HomeState {
  final WeatherModel? weatherModel;

  WeatherSuccessState({this.weatherModel});

  @override
  List<Object?> get props => [weatherModel];
}

class WeatherFailureState extends HomeState {
  final Failure failure;

  WeatherFailureState({required this.failure});

  @override
  List<Object?> get props => [failure];
}
