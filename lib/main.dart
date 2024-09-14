import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_ecommerce_app/core/routes_manager/routes.dart';
import 'package:flutter_ecommerce_app/core/routes_manager/routes_generator.dart';
import 'package:flutter_ecommerce_app/core/utils/shared_preference.dart';
import 'package:flutter_ecommerce_app/di/di.dart';
import 'package:flutter_ecommerce_app/features/home_screen/wish_list_tab/presentation/manager/wishlist_view_model.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  configureDependencies();
  SharedPreferenceUtil.init();
  runApp(MultiBlocProvider(
      providers: [
        BlocProvider(create: (context)=> getIt<WishlistViewModel>())
      ],
      child: const MyApp()
  ));
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
        return  const MaterialApp(
          debugShowCheckedModeBanner: false,
          onGenerateRoute: RoutesGenerator.getRoute,
          initialRoute: Routes.mainRoute,
        );
      },
    );
  }
}
