import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

mixin RouteHelper {
  static final GlobalKey<NavigatorState> navigatorKey =
  GlobalKey<NavigatorState>();

  static BuildContext get navigatorContext => navigatorKey.currentContext!;

  static Future push(String routeName, {Object? args}) async {
    return navigatorKey.currentState!.pushNamed(
      routeName,
      arguments: args,
    );
  }

  static Future pushReplacement(String routeName, {Object? args}) async {
    return navigatorKey.currentState!.pushReplacementNamed(
      routeName,
      arguments: args,
    );
  }

  static Future pushAndPopOthers(String routeName, {Object? args}) async {
    return navigatorKey.currentState!.pushNamedAndRemoveUntil(
      routeName,
          (Route<dynamic> route) => false,
      arguments: args,
    );
  }

  static void pop({dynamic args}) {
    navigatorKey.currentState!.pop(args);
  }

  static bool canPop() {
    return navigatorKey.currentState!.canPop();
  }

  static Future<void> maybePop() {
    return navigatorKey.currentState!.maybePop();
  }

  static void popUntil(String routesName) {
    navigatorKey.currentState!.popUntil(ModalRoute.withName(routesName));
  }

  static void removeUntil(String routesName) {
    navigatorKey.currentState!
        .pushNamedAndRemoveUntil(routesName, (Route<dynamic> route) => false);
  }

  static Future exitApp() {
    return SystemNavigator.pop();
  }
}
