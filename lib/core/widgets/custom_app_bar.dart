import 'package:flutter/material.dart';
import 'package:flutter_ecommerce_app/core/assets_manager/assets_manager.dart';
import 'package:flutter_ecommerce_app/core/color_manager/color_manager.dart';
import 'package:flutter_ecommerce_app/core/values_manager/values_manager.dart';
import 'package:flutter_ecommerce_app/core/widgets/main_text_field.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  CustomAppBar();

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight + 60.h); // Increase the height

  @override
  Widget build(BuildContext context) {
    return AppBar(
      centerTitle: false,
      title: Image.asset(
        ImagesAssets.logoNavIcon,
        height: kToolbarHeight * 0.6, // Reduce the size of the logo if necessary
      ),
      bottom: PreferredSize(
        preferredSize: preferredSize,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: AppPadding.p12),
          child: Row(
            children: [
              Expanded(
                child: MainTextField(
                  isRounded: true,
                  isObscured: false,
                  borderColor: ColorManager.primaryColor,
                  textInputType: TextInputType.text,
                  isReadOnly: false,
                  hint: 'What do you search for?',
                  prefixIcon: const Icon(
                    Icons.search,
                    color: ColorManager.darkPrimaryColor,
                    size: AppSize.s28,
                  ),
                ),
              ),
              SizedBox(width: AppSize.s15.w),
              IconButton(
                onPressed: () {},
                icon: Image.asset(
                  ImagesAssets.cartIcon,
                  height: AppSize.s28.h, // Limit the size of the icon
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }


}
