import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_ecommerce_app/core/assets_manager/assets_manager.dart';
import 'package:flutter_ecommerce_app/core/color_manager/color_manager.dart';
import 'package:flutter_ecommerce_app/features/home_screen/products_tab/domain/entities/productsResponseEntity.dart';
import 'package:flutter_ecommerce_app/features/home_screen/wish_list_tab/presentation/manager/wishlist_view_model.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class FavoriteButton extends StatefulWidget {
  FavoriteButton({
    super.key,
    required this.product,
  });

  final ProductEntity product;
  @override
  State<FavoriteButton> createState() => _FavoriteButtonState();
}

class _FavoriteButtonState extends State<FavoriteButton> {
  // Icon data (optional)
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        WishlistViewModel.getProvider(context)
            .toggleItemInFavorite(product: widget.product);
      },
      child: Container(
        height: 30.h,
        width: 30.h,
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
                color: Colors.black.withOpacity(0.25),
                offset: const Offset(0, 4),
                spreadRadius: 0,
                blurRadius: 4)
          ],
          shape: BoxShape.circle,
          color: ColorManager.white,
        ),
        child: BlocBuilder<WishlistViewModel, WishlistViewModelState>(
          builder: (context, state) {
            return Center(
                child: Image.asset(
              WishlistViewModel.getProvider(context)
                      .isItemInWishList(product: widget.product)
                  ? ImagesAssets.favoriteIcon
                  : ImagesAssets.unFavoriteIcon,
              fit: BoxFit.cover,
              color: ColorManager.primaryColor,
            ) // Display the image if provided// Empty widget if neither is provided
                );
          },
        ),
      ),
    );
  }
}
