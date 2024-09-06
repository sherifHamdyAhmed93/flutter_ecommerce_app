import 'package:flutter/material.dart';
import 'package:flutter_ecommerce_app/core/color_manager/color_manager.dart';
import 'package:flutter_ecommerce_app/core/font_manager/font_manager.dart';
import 'package:flutter_ecommerce_app/core/style_manager/style_manager.dart';
import 'package:flutter_ecommerce_app/core/values_manager/values_manager.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomElevatedButton extends StatelessWidget {
  const CustomElevatedButton({super.key, required this.label, this.labelTextStyle, this.backgroundColor, this.raduis, this.suffixIcon, this.prefixIcon,required this.onTap});

  final String label;
  final TextStyle? labelTextStyle;

  final Color? backgroundColor;
  final double? raduis;

  final Widget? suffixIcon;
  final Widget? prefixIcon;

  final void Function() onTap;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: backgroundColor ?? ColorManager.primaryColor,
        padding: EdgeInsets.symmetric(horizontal: 15.w,vertical: 14.h),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(17.r)
        )
      ),
        onPressed: onTap,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            prefixIcon ?? const SizedBox(),
            SizedBox(width: AppSize.s28.w,),
            Text(label,style: labelTextStyle ?? mediumTextStyle(color: ColorManager.white,fontSize: FontSize.s20),),
            SizedBox(width: AppSize.s28.w,),
            suffixIcon ?? const SizedBox(),
          ],
        )
    );
  }
}
