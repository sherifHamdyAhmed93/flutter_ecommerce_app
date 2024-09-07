import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_ecommerce_app/core/assets_manager/assets_manager.dart';
import 'package:flutter_ecommerce_app/core/constants/app_constants.dart';
import 'package:flutter_ecommerce_app/core/routes_manager/routes.dart';
import 'package:flutter_ecommerce_app/core/utils/shared_preference.dart';

class SplashScreen extends StatelessWidget {
   SplashScreen({super.key});
  @override
  Widget build(BuildContext context) {
    Timer(const Duration(seconds: 3), () {
      String route;
      var token = SharedPreferenceUtil.getData(key: SharedPreferencesConstants.token);
      if (token is String){
        route =  Routes.mainRoute;
      }else{
        route =  Routes.signInRoute;
      }
      Navigator.pushReplacementNamed(context, route);
    });
    return Scaffold(
      body: Image.asset(
        ImagesAssets.splashScreen,
        width: double.infinity,
        height: double.infinity,
        fit: BoxFit.cover
      ),
    );
  }
}
