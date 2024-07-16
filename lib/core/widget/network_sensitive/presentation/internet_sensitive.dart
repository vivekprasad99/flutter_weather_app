

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_weather_app/core/widget/network_sensitive/presentation/cubit/internet_cubit.dart';

class InternetSensitive extends StatelessWidget {
  final Widget? child;

  const InternetSensitive({super.key, this.child});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<InternetCubit, InternetState>(
      builder: (internetCubitBuilderContext, state) {
        if (kIsWeb) {
          return child ?? const SizedBox();
        } else if (state is InternetConnected) {
          return child ?? const SizedBox();
        } else if (state is InternetDisconnected) {
          return buildNoInternetUI(context);
        }
        return child ?? const SizedBox();
      },
    );
  }

  Widget buildNoInternetUI(BuildContext context) {
    return const Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Text('No Internet Connection!',style: TextStyle(color: Colors.white),),
          SizedBox(height: 4),
          Text('Please try to connect with internet.',style: TextStyle(color: Colors.white))
        ],
      ),
    );
  }
}