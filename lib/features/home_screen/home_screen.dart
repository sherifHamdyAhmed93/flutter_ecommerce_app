import 'package:flutter/material.dart';
import 'package:flutter_ecommerce_app/core/assets_manager/assets_manager.dart';
import 'package:flutter_ecommerce_app/core/color_manager/color_manager.dart';
import 'package:flutter_ecommerce_app/core/widgets/custom_app_bar.dart';
import 'package:flutter_ecommerce_app/core/widgets/custom_bottom_nav_bar_item.dart';
import 'package:flutter_ecommerce_app/features/home_screen/category_tab/category_screen.dart';
import 'package:flutter_ecommerce_app/features/home_screen/favorite_screen/favorite_screen.dart';
import 'package:flutter_ecommerce_app/features/home_screen/home_tab/home_tab.dart';
import 'package:flutter_ecommerce_app/features/home_screen/profile_tab/profile_screen.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int currentIndex = 0;

  var items = [HomeTab(), CategoryScreen(), FavoriteScreen(), ProfileScreen()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(),
      bottomNavigationBar: ClipRRect(
        borderRadius: const BorderRadius.only(
            topRight: Radius.circular(15), topLeft: Radius.circular(15)),
        child: SizedBox(
          height: (MediaQuery.of(context).size.height * 0.12).h,
          child: BottomNavigationBar(
              type: BottomNavigationBarType.fixed,
              showSelectedLabels: false,
              showUnselectedLabels: false,
              currentIndex: currentIndex,
              onTap: (index) {
                currentIndex = index;
                setState(() {});
              },
              backgroundColor: ColorManager.primaryColor,
              items: [
                CustomBottomNavBarItem(title: '',iconPath: TabBarAssets.homeIcon ),
                CustomBottomNavBarItem(title: '',iconPath: TabBarAssets.categoryIcon ),
                CustomBottomNavBarItem(title: '',iconPath: TabBarAssets.favoriteIcon ),
                CustomBottomNavBarItem(title: '',iconPath: TabBarAssets.profileIcon ),
              ]),
        ),
      ),
      body: items[currentIndex],
    );
  }
}
