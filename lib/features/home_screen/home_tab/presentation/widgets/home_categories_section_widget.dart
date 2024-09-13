import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_ecommerce_app/core/color_manager/color_manager.dart';
import 'package:flutter_ecommerce_app/core/values_manager/values_manager.dart';
import 'package:flutter_ecommerce_app/core/widgets/category_widget.dart';
import 'package:flutter_ecommerce_app/core/widgets/custom_error_widget.dart';
import 'package:flutter_ecommerce_app/core/widgets/custom_header_section.dart';
import 'package:flutter_ecommerce_app/di/di.dart';
import 'package:flutter_ecommerce_app/features/home_screen/home_tab/presentation/manager/home_tab_categories_view_model_cubit.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeCategoriesSectionWidget extends StatelessWidget {
   HomeCategoriesSectionWidget({super.key});
  HomeTabCategoriesViewModelCubit viewModel = getIt<HomeTabCategoriesViewModelCubit>();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeTabCategoriesViewModelCubit, HomeTabCategoriesViewModelState>(
      bloc: viewModel..getCategories(),
        listener: (context, state) {
          // TODO: implement listener
        },
        builder: (context, state) {
          if (state is HomeTabViewModelCategoriesFetched){
            return Column(
              children: [
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
                    itemCount: state.categoryOrBrandResponseEntity.data!.length ?? 0,
                    itemBuilder: (context, index) {
                      return CategoryWidget(item: state.categoryOrBrandResponseEntity.data![index],);
                    },
                  ),
                ),
              ],
            );
          }else if (state is HomeTabViewModelCategoriesError){
            return TryAgainWidget(errorMessage: state.error.errorMessage, onError: viewModel.getCategories);
          }else{
            return Center(child: CircularProgressIndicator(color: ColorManager.primaryColor,),);
          }
        },
      );
  }
}