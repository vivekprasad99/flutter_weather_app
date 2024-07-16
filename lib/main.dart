import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_weather_app/core/router/router.dart';
import 'package:flutter_weather_app/core/services/common_di/injection_container.dart';
import 'package:flutter_weather_app/core/services/di/injection_container.dart';
import 'package:flutter_weather_app/core/widget/network_sensitive/presentation/cubit/internet_cubit.dart';
import 'package:flutter_weather_app/weather/splash/presentation/screens/widget/splash_widget.dart';
import 'package:oktoast/oktoast.dart';

import 'weather/splash/presentation/cubit/splash_cubit.dart';

void main() async {
  await dotenv.load(fileName: 'assets/.env');
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
  await initCoreDI();
  await initCommon();
  runApp(MultiBlocProvider(
      providers: [
        BlocProvider<InternetCubit>(
          create: (_) => InternetCubit(di<Connectivity>()),
        ),
      ],
      child: const MyApp()));
  // runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return OKToast(
      child: MaterialApp(
        title: 'Flutter Weather Application',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        onGenerateRoute: RouteGenerator.generateRoute,
        home: BlocProvider<SplashCubit>(
            create: (context) => di<SplashCubit>(),
            child: const SplashWidget()
        ),
      ),
    );
  }
}