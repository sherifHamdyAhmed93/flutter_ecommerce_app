import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_ecommerce_app/core/color_manager/color_manager.dart';
import 'package:flutter_ecommerce_app/core/values_manager/values_manager.dart';
import 'package:flutter_ecommerce_app/core/widgets/category_product_widget.dart';
import 'package:flutter_ecommerce_app/core/widgets/custom_error_widget.dart';
import 'package:flutter_ecommerce_app/di/di.dart';
import 'package:flutter_ecommerce_app/features/home_screen/products_tab/domain/entities/productsResponseEntity.dart';
import 'package:flutter_ecommerce_app/features/home_screen/products_tab/presentation/manager/products_view_model_cubit.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProductsTabScreen extends StatefulWidget {
   ProductsTabScreen({super.key});

  @override
  State<ProductsTabScreen> createState() => _ProductsTabScreenState();
}

class _ProductsTabScreenState extends State<ProductsTabScreen> {
   ProductsViewModelCubit viewModel = getIt<ProductsViewModelCubit>();

  ScrollController scrollController = ScrollController();

   @override
   void initState() {
     super.initState();
     // TODO: implement initState
     scrollController.addListener(onScroll);
   }


  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(AppPadding.p12),
      child: BlocBuilder<
          ProductsViewModelCubit,
          ProductsViewModelState>(
          bloc: viewModel..getProducts(),
          builder: (context, state) {
            if (state is ProductsViewModelStateDataFetched) {
              return _buildSearchResults(state.products,state);
            }else if (state is ProductsViewModelStateLoadMoreData) {
              return _buildSearchResults(viewModel.products,state);
            } else if (state is ProductsViewModelStateError) {
              return TryAgainWidget(errorMessage: state.error.errorMessage,
                  onError: viewModel.getProducts);
            }else if (state is ProductsViewModelInitial){
              return _buildEmptyState();
            } else {
              return const Center(
                child: CircularProgressIndicator(color: ColorManager.primaryColor,),);
            }
          }
      ),

    );
  }

   Widget _buildSearchResults(List<ProductEntity> products,ProductsViewModelState state) {
     var isLoadMore = state is ProductsViewModelStateLoadMoreData;
     return products.isEmpty ?
     _buildEmptyState()
         :
     GridView.builder(
       shrinkWrap: true,
       controller: scrollController,
       gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
           crossAxisCount: 2,
           mainAxisSpacing: 10,
           crossAxisSpacing: 10,
           mainAxisExtent: 250.h
       ),
       scrollDirection: Axis.vertical,
       itemCount: isLoadMore ? products.length + 1 : products.length,
       itemBuilder: (context, index) {
         if (index < products.length) {
           return CategoryProductWidget(product: products[index]);
         } else {
           return const Center(child: CircularProgressIndicator(
               color: ColorManager.primaryColor));
         }
       },
     );
   }

   Widget _buildEmptyState() {
     return const Center(
         child: Text('No products found')
     );
   }

   void onScroll() {
     if (scrollController.position.pixels == scrollController.position.maxScrollExtent && (viewModel.state is! ProductsViewModelStateLoadMoreData)) {
       viewModel.loadMore();
     }
   }
}

