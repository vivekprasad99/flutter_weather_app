import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

GetIt di = GetIt.instance;

Future<void> initCoreDI() async {
  di.registerLazySingleton<Connectivity>(() => Connectivity());
  di.registerFactory(() => Dio());
}