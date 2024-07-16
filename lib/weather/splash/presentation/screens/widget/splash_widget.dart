import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_weather_app/core/router/route_helper.dart';
import 'package:flutter_weather_app/core/router/routes.dart';
import 'package:flutter_weather_app/weather/splash/presentation/cubit/splash_cubit.dart';

class SplashWidget extends StatelessWidget {
  const SplashWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return buildSplashForMobile();
  }

  Widget buildSplashForMobile() {
    return BlocConsumer<SplashCubit, SplashState>(
      listener: (context, state) {
        if ((state is TimerState && (state.isTimerCompleted ?? false))) {
          _launchHomeScreen(context);
        }
      },
      builder: (context, state) {
        return const Scaffold(
          backgroundColor: Colors.teal,
          body: Center(
            child:
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Weather App",style: TextStyle(color: Colors.white,fontSize: 36,fontWeight: FontWeight.bold),),
                SizedBox(height: 4,),
                CircularProgressIndicator(
                  color: Colors.white,
                  strokeWidth: 4,
                )
              ],
            ),

          ),
        );
      },
    );
  }

  void _launchHomeScreen(BuildContext context) {
    Navigator.of(context).pushNamedAndRemoveUntil(
      Routes.HOME,(Route<dynamic> route) => false
    );
  }
}