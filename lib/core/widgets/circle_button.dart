import 'package:flutter/material.dart';
import 'package:flutter_ecommerce_app/core/color_manager/color_manager.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CircleButton extends StatelessWidget {
  CircleButton({
    super.key,
    required this.onTap,
    this.icon,
    this.imageAsset,
    this.backgroundColor = ColorManager.primaryColor
  });

  final Function()? onTap;
  final IconData? icon;     // Icon data (optional)
  final String? imageAsset; // Image asset path (optional)
  final Color backgroundColor; // Image asset path (optional)

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: 30.h,
        width: 30.h,
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.25),
              offset: const Offset(0, 4),
              spreadRadius: 0,
              blurRadius: 4
            )
          ],
          shape: BoxShape.circle,
          color: backgroundColor,
        ),
        child: Center(
          child: icon != null
              ? Icon(icon, color: ColorManager.white) // Display the icon if provided
              : imageAsset != null
              ? Image.asset(imageAsset!, fit: BoxFit.cover,color: ColorManager.primaryColor,) // Display the image if provided
              : const SizedBox(), // Empty widget if neither is provided
        ),
      ),
    );
  }
}
