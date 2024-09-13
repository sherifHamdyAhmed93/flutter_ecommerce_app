import 'package:flutter/material.dart';
import 'package:flutter_ecommerce_app/core/values_manager/values_manager.dart';
import 'package:flutter_ecommerce_app/core/widgets/announcment_section.dart';
import 'package:flutter_ecommerce_app/features/home_screen/home_tab/presentation/pages/home_brands_section_widget.dart';
import 'package:flutter_ecommerce_app/features/home_screen/home_tab/presentation/pages/home_categories_section_widget.dart';

class HomeTab extends StatelessWidget {
   HomeTab({super.key});


  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          AnnouncmentSection(),
          HomeCategoriesSectionWidget(),
          const SizedBox(height: AppSize.s28,),
          HomeBrandsSectionWidget(),
          const SizedBox(height: AppSize.s15,),
        ],
      ),
    );
  }
}
