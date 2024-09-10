import 'package:flutter/material.dart';
import 'package:flutter_ecommerce_app/core/color_manager/color_manager.dart';
import 'package:flutter_ecommerce_app/core/font_manager/font_manager.dart';
import 'package:flutter_ecommerce_app/core/style_manager/style_manager.dart';
import 'package:flutter_ecommerce_app/core/values_manager/values_manager.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CategoryWidget extends StatelessWidget {
  const CategoryWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(100.r),
          clipBehavior: Clip.antiAlias,
          child: Image.network(
              'https://placehold.co/600x400/png',
            width: 100.h,
            height: 100.w,
            fit: BoxFit.cover,
          ),
        ),
        const SizedBox(height: AppSize.s8,),
        Expanded(child: Text('Women’s\nfashion',maxLines: 2,overflow: TextOverflow.ellipsis,style: regularTextStyle(color: ColorManager.black,fontSize: FontSize.s12),textAlign: TextAlign.center,))
      ],
    );
  }
}
