import 'package:flutter/material.dart';
import 'package:flutter_ecommerce_app/core/routes_manager/routes.dart';
import 'package:flutter_ecommerce_app/features/auth%20screen/sign_in_screen/sign_in_screen.dart';
import 'package:flutter_ecommerce_app/features/splash_screen/splash_screen.dart';

abstract class RoutesGenerator{
  static Route<dynamic> getRoute(RouteSettings settings){
    switch (settings.name){
      case Routes.splashScreenRoute:
        return MaterialPageRoute(builder: (_) => const SplashScreen());
      case Routes.signInRoute:
        return MaterialPageRoute(builder: (_) => const SignInScreen());
      default:
        return undefinedRoute();
    }
  }

  static Route<dynamic> undefinedRoute() {
    return MaterialPageRoute(builder: (_){
      return Scaffold(
        appBar: AppBar(title: const Text('No Route found'),),
        body: const Center(child: Text('No Route found'),),
      );
    });
  }
}