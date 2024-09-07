import 'package:flutter/material.dart';
import 'package:flutter_ecommerce_app/core/color_manager/color_manager.dart';
import 'package:flutter_ecommerce_app/core/constants/app_constants.dart';
import 'package:flutter_ecommerce_app/core/routes_manager/routes.dart';
import 'package:flutter_ecommerce_app/core/utils/shared_preference.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: IconButton(
          onPressed: (){
              SharedPreferenceUtil.removeData(key: SharedPreferencesConstants.token);
             Navigator.pushNamedAndRemoveUntil(context, Routes.signInRoute, (route)=>false);
          },
          icon: Icon(Icons.logout,size: 30,color: ColorManager.primaryColor,)
      ))
    );
  }
}
