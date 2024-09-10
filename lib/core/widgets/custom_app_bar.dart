import 'package:flutter/material.dart';
import 'package:flutter_ecommerce_app/core/assets_manager/assets_manager.dart';
import 'package:flutter_ecommerce_app/core/color_manager/color_manager.dart';
import 'package:flutter_ecommerce_app/core/font_manager/font_manager.dart';
import 'package:flutter_ecommerce_app/core/routes_manager/routes.dart';
import 'package:flutter_ecommerce_app/core/style_manager/style_manager.dart';
import 'package:flutter_ecommerce_app/core/values_manager/values_manager.dart';
import 'package:flutter_ecommerce_app/core/widgets/main_text_field.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomAppBar extends StatefulWidget implements PreferredSizeWidget {
  CustomAppBar({required this.isProfile});
  bool isProfile;
  Size get preferredSize => Size.fromHeight(kToolbarHeight + 60.h);

  @override
  State<CustomAppBar> createState() => _CustomAppBarState();
}

class _CustomAppBarState extends State<CustomAppBar> {
  @override
 // Increase the height
  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: ColorManager.white,
      centerTitle: false,
      title: Image.asset(
        ImagesAssets.logoNavIcon,
        // height: kToolbarHeight * 0.6, // Reduce the size of the logo if necessary
      ),
      bottom: PreferredSize(
        preferredSize: widget.preferredSize,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: AppPadding.p8),
          child: widget.isProfile ? _buildNameWithEmail() : _buildSearchWithCart(),
        ),
      ),
    );
  }

  Widget _buildSearchWithCart(){
    return Row(
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
        SizedBox(width: AppSize.s8.w),
        IconButton(
          onPressed: () {
            Navigator.pushNamed(context,Routes.cartRoute);
          },
          icon: Image.asset(
            ImagesAssets.cartIcon,
            height: AppSize.s28.h, // Limit the size of the icon
          ),
        ),
      ],
    );
  }

  Widget _buildNameWithEmail(){
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Text('Welcome, Mohamed',textAlign: TextAlign.start,style: mediumTextStyle(color: ColorManager.darkPrimaryColor,fontSize: FontSize.s18),),
        Text('mohamed.N@gmail.com.',textAlign: TextAlign.start,style: regularTextStyle(color: ColorManager.darkPrimaryColor.withOpacity(0.6),fontSize: FontSize.s14),),
      ],
    );
  }
}
