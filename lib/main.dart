import 'package:flutter/material.dart';
import 'package:flutter_ecommerce_app/core/routes_manager/routes.dart';
import 'package:flutter_ecommerce_app/core/routes_manager/routes_generator.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: Size(430, 932),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (_,child){
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          onGenerateRoute: RoutesGenerator.getRoute,
          initialRoute: Routes.splashScreenRoute,
          home: child,
        );
      },
    );
  }
}
