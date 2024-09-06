import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_ecommerce_app/core/assets_manager/assets_manager.dart';
import 'package:flutter_ecommerce_app/core/routes_manager/routes.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Timer.periodic(const Duration(seconds: 3),(_){
      Navigator.pushNamed(context,Routes.signInRoute);
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
