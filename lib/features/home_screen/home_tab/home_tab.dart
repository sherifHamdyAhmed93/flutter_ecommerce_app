import 'package:flutter/material.dart';
import 'package:flutter_ecommerce_app/core/values_manager/values_manager.dart';
import 'package:flutter_ecommerce_app/core/widgets/custom_header_section.dart';
import 'package:flutter_ecommerce_app/features/home_screen/home_tab/announcment_section.dart';
import 'package:flutter_ecommerce_app/features/home_screen/home_tab/category_widget.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeTab extends StatelessWidget {
  const HomeTab({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          AnnouncmentSection(),
          CustomHeaderSection(section: 'Categories',),
          const SizedBox(height: AppSize.s15,),
          SizedBox(
            height: 290.h,
            child: GridView.builder(
              shrinkWrap: true,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 10,
                crossAxisSpacing: 10,
                // mainAxisExtent: 144.h
              ),
              scrollDirection: Axis.horizontal,
              itemCount: 20,
              itemBuilder: (context, index) {
                return CategoryWidget();
              },
            ),
          ),
          const SizedBox(height: AppSize.s28,),
          CustomHeaderSection(section: 'Brands',),
          const SizedBox(height: AppSize.s15,),
          SizedBox(
            height: 290.h,
            child: GridView.builder(
              shrinkWrap: true,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 10,
                crossAxisSpacing: 10,
                // mainAxisExtent: 144.h
              ),
              scrollDirection: Axis.horizontal,
              itemCount: 20,
              itemBuilder: (context, index) {
                return CategoryWidget();
              },
            ),
          ),
          const SizedBox(height: AppSize.s15,),
        ],
      ),
    );
  }
}
