import 'package:flutter/material.dart';
import 'package:flutter_ecommerce_app/core/color_manager/color_manager.dart';
import 'package:flutter_ecommerce_app/core/font_manager/font_manager.dart';
import 'package:flutter_ecommerce_app/core/style_manager/style_manager.dart';
import 'package:flutter_ecommerce_app/core/values_manager/values_manager.dart';
import 'package:flutter_ecommerce_app/main.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MainTextField extends StatefulWidget {
   MainTextField({super.key, this.textEditingController, required this.isObscured,this.isRounded = false, this.focusNode, this.nextFocus, this.label, this.hint, required this.textInputType, this.iconData, this.labelTextStyle, this.hintTextStyle, this.backgroundColor, this.borderColor, this.cursorColor, required this.isReadOnly, this.maxLines, this.suffixIcon, this.prefixIcon, this.onTap, this.validation});

  final TextEditingController? textEditingController;
  final bool isObscured;
   final FocusNode? focusNode;
   final FocusNode? nextFocus;
   final String? label;
   final String? hint;
   final TextInputType textInputType;
   final IconData? iconData;

   final TextStyle? labelTextStyle;
   final TextStyle? hintTextStyle;

   final Color? backgroundColor;
   final Color? borderColor;
   final Color? cursorColor;

   final bool isReadOnly;
   final bool isRounded;

   final int? maxLines;

   final Widget? suffixIcon;
   final Widget? prefixIcon;

   final void Function()? onTap;
   final String? Function(String?)? validation;

  @override
  State<MainTextField> createState() => _MainTextFieldState();
}

class _MainTextFieldState extends State<MainTextField> {
  late bool isHidden = widget.isObscured;
   @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        widget.label != null ? 
            Padding(
              padding: const EdgeInsets.only(top:AppPadding.p5),
              child: Text(widget.label! , style: mediumTextStyle(color: ColorManager.white).copyWith(fontSize: FontSize.s18.sp),),
            )
            :
            SizedBox(),
        Container(
          margin: EdgeInsets.only(top: AppMargin.m12),
          // padding: const EdgeInsets.all(AppPadding.p5),
          decoration: BoxDecoration(
            color: widget.backgroundColor ?? ColorManager.white,
            borderRadius: BorderRadius.circular(widget.isRounded ? AppSize.s28 : AppSize.s15),
            border: Border.all(color: widget.borderColor ?? ColorManager.white)
          ),
          clipBehavior: Clip.antiAliasWithSaveLayer,
          child: TextFormField(
            obscureText: widget.isObscured,
            maxLines: widget.isObscured ? 1:widget.maxLines,
            controller: widget.textEditingController,
            validator: widget.validation,
            readOnly: widget.isReadOnly,
            onTap: widget.onTap,
            focusNode: widget.focusNode,
            keyboardType: widget.textInputType,
            style: mediumTextStyle(color: ColorManager.black).copyWith(fontSize: FontSize.s16.sp),
            cursorColor: widget.cursorColor,
            decoration: InputDecoration(
              border: OutlineInputBorder(borderRadius: BorderRadius.zero,borderSide: BorderSide.none),
              suffixIcon: widget.suffixIcon,
              prefixIcon: widget.prefixIcon,
              hintText: widget.hint,
              hintStyle: widget.hintTextStyle ?? lightTextStyle(color: ColorManager.black.withOpacity(0.7),fontSize: FontSize.s18.sp),
            ),
          ),
        )
      ],
    );
  }
}
