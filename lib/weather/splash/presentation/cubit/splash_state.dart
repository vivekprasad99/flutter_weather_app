part of 'splash_cubit.dart';

@immutable
sealed class SplashState extends Equatable{}

class SplashInitial extends SplashState {
  @override
  List<Object?> get props => [];
}

class TimerState extends SplashState {
  final bool? isTimerCompleted;

  TimerState({this.isTimerCompleted});

  @override
  List<Object?> get props => [isTimerCompleted];
}