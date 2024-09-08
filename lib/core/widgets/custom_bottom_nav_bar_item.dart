import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ecommerce_app/core/color_manager/color_manager.dart';

class CustomBottomNavBarItem extends BottomNavigationBarItem {
  String title;
  String iconPath;
   CustomBottomNavBarItem({required this.iconPath,required this.title}) : super(
    icon: ImageIcon(AssetImage(iconPath),color: ColorManager.white,),
    label: title,
    activeIcon: CircleAvatar(backgroundColor: ColorManager.white,child: ImageIcon(AssetImage(iconPath),color: ColorManager.primaryColor,))
  );

}
