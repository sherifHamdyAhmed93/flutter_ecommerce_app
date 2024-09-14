import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_ecommerce_app/core/color_manager/color_manager.dart';
import 'package:flutter_ecommerce_app/core/values_manager/values_manager.dart';
import 'package:flutter_ecommerce_app/core/widgets/alert_dialog.dart';
import 'package:flutter_ecommerce_app/core/widgets/custom_error_widget.dart';
import 'package:flutter_ecommerce_app/core/widgets/favorite_product_widget.dart';
import 'package:flutter_ecommerce_app/features/home_screen/wish_list_tab/presentation/manager/wishlist_view_model.dart';

class FavoriteScreen extends StatefulWidget {
  FavoriteScreen({super.key});

  @override
  State<FavoriteScreen> createState() => _FavoriteScreenState();
}

class _FavoriteScreenState extends State<FavoriteScreen> implements WishListNavgitor{

  @override
  void initState() {
    // TODO: implement initState
    WishlistViewModel.getProvider(context).navgitor = this;
    WishlistViewModel.getProvider(context).getProducts();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<WishlistViewModel, WishlistViewModelState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        if (state is WishlistViewModelStateDataFetched) {
          return  state.products.isEmpty ?
          _buildEmptyState()
              :
            ListView.separated(
            separatorBuilder: (context, index) {
              return SizedBox(height: AppSize.s15,);
            },
            shrinkWrap: true,
            padding: EdgeInsets.all(AppPadding.p12),
            scrollDirection: Axis.vertical,
            itemCount: state.products.length,
            itemBuilder: (context, index) {
              return FavoriteProductWidget(product: state.products[index],);
            },
          );
        } else if (state is WishlistViewModelStateError) {
          return TryAgainWidget(errorMessage: state.error.errorMessage,
              onError: WishlistViewModel.getProvider(context).getProducts);
        }else {
          return const Center(
            child: CircularProgressIndicator(color: ColorManager.primaryColor,),);
        }
      },
    );
  }

  Widget _buildEmptyState() {
    return const Center(
        child: Text('Wishlist is empty')
    );
  }

  @override
  void hideLoading() {
    DialogUtils.hideLoader(context);
  }

  @override
  void itemAdd(String itemName) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('$itemName added to watchList')),
    );
  }

  @override
  void itemRemove(String itemName) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('$itemName Removed to watchList')),
    );
  }

  @override
  void showLoading() {
    DialogUtils.showLoader(context: context, message: 'Loading...');
  }

}
