import 'package:flutter/material.dart';
import 'package:flutter_ecommerce_app/core/color_manager/color_manager.dart';
import 'package:flutter_ecommerce_app/core/constants/app_constants.dart';
import 'package:flutter_ecommerce_app/core/routes_manager/routes.dart';
import 'package:flutter_ecommerce_app/core/utils/shared_preference.dart';
import 'package:flutter_ecommerce_app/core/values_manager/values_manager.dart';
import 'package:flutter_ecommerce_app/features/home_screen/home_tab/category_widget.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeTab extends StatelessWidget {
  const HomeTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body:Padding(
          padding: EdgeInsets.all(AppSize.s15),
              child:  SizedBox(
                height: 290.h,
                child: GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                    mainAxisSpacing: 10,
                    crossAxisSpacing: 10,
                    // mainAxisExtent: 144.h
                  ),
                  scrollDirection: Axis.horizontal,
                  itemCount: 20,
                  itemBuilder: (context,index){
                    return CategoryWidget();
                  },
                ),
              ),
            ),
      );
      // SingleChildScrollView(
      //   child: Expanded(
      //     child: Column(
      //       children: [
      //         Expanded(
      //           child: GridView.builder(
      //             shrinkWrap: true,
      //             gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
      //             scrollDirection: Axis.horizontal,
      //             itemCount: 10,
      //             itemBuilder: (context,index){

      //             },
      //           ),
      //         )
      //       ],
      //     ),
      //   ),
      // )
  }
}
