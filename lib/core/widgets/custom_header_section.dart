import 'package:flutter/material.dart';
import 'package:flutter_ecommerce_app/core/color_manager/color_manager.dart';
import 'package:flutter_ecommerce_app/core/font_manager/font_manager.dart';
import 'package:flutter_ecommerce_app/core/style_manager/style_manager.dart';
import 'package:flutter_ecommerce_app/core/values_manager/values_manager.dart';

class CustomHeaderSection extends StatelessWidget {
  String section;
   CustomHeaderSection({super.key,required this.section});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: AppSize.s15,right: AppSize.s15),
      child: Row(
        mainAxisAlignment : MainAxisAlignment.spaceBetween,
        children: [
          Text(section,style: mediumTextStyle(color: ColorManager.black,fontSize: FontSize.s16),),
          Text('view all',style: regularTextStyle(color: ColorManager.darkPrimaryColor,fontSize: FontSize.s12),),
        ],
      ),
    );
  }
}
