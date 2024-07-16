import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_weather_app/core/router/routes.dart';
import 'package:flutter_weather_app/core/services/di/injection_container.dart';
import 'package:flutter_weather_app/weather/home/presentation/cubit/home_cubit.dart';
import 'package:flutter_weather_app/weather/home/presentation/screens/widget/home_widget.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    final String? routeName = settings.name;
    Widget widget;
    switch (routeName) {
      case Routes.HOME:
        widget = BlocProvider<HomeCubit>(
            create: (context) => di<HomeCubit>(),
            child:  HomeWidget());
        break;
      default:
        widget =  HomeWidget();
        break;
    }
    return MaterialPageRoute(
      builder: (context) => widget,
      settings: RouteSettings(name: routeName),
    );
  }
}
