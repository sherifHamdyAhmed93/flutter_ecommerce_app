import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_ecommerce_app/data/dto/failure.dart';
import 'package:flutter_ecommerce_app/features/home_screen/products_tab/domain/entities/productsResponseEntity.dart';
import 'package:flutter_ecommerce_app/features/home_screen/wish_list_tab/domain/use_cases/add_to_wishlist_usecase.dart';
import 'package:flutter_ecommerce_app/features/home_screen/wish_list_tab/domain/use_cases/remove_from_wishlist_usecase.dart';
import 'package:flutter_ecommerce_app/features/home_screen/wish_list_tab/domain/use_cases/wishlist_usecase.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';

part 'wishlist_view_model_state.dart';

@injectable
class WishlistViewModel extends Cubit<WishlistViewModelState> {
  List<ProductEntity> products = [];
  List<String> productIds = [];

  WishListNavgitor? navgitor;

  WishListUseCase wishListUseCase;
  AddToWishListUseCase addToWishListUseCase;
  RemoveFromWishListUseCase removeFromWishListUseCase;

  WishlistViewModel({required this.wishListUseCase,required this.addToWishListUseCase,required this.removeFromWishListUseCase}) : super(WishlistViewModelInitial());

  static WishlistViewModel getProvider(BuildContext context) => BlocProvider.of(context);

  void getProducts() async{
    emit(WishlistViewModelStateLoading());
    var either = await wishListUseCase.invoke();
    either.fold(
            (failure)=> emit(WishlistViewModelStateError(error: failure)),
            (response){
              products = response.data ?? [];
              emit(WishlistViewModelStateDataFetched(products: products));
        }
    );
  }

  void toggleItemInFavorite({ required ProductEntity product}){
    if (products.contains(product) || productIds.contains(product.id)) {
      removeFromWishList(product: product);
    }else{
      addToWishList(product: product);
    }
  }
    void removeFromWishList({ required ProductEntity product}) async{
    navgitor?.showLoading();
    var either = await removeFromWishListUseCase.invoke(productId: product.id ?? '');
    navgitor?.hideLoading();
    either.fold(
            (failure)=> emit(WishlistViewModelStateError(error: failure)),
            (response){
              products.remove(product);
              productIds = response.data ?? [];
              navgitor?.itemRemove(product.title ?? '');
              emit(WishlistViewModelStateDataFetched(products: products));
        }
    );
  }

  void addToWishList({ required ProductEntity product}) async{
    navgitor?.showLoading();
    var either = await addToWishListUseCase.invoke(productId: product.id ?? '');
    navgitor?.hideLoading();
    either.fold(
            (failure)=> emit(WishlistViewModelStateError(error: failure)),
            (response){
          products.add(product);
          productIds = response.data ?? [];
          navgitor?.itemAdd(product.title ?? '');
          emit(WishlistViewModelStateDataFetched(products: products));
        }
    );
  }

  bool isItemInWishList({required ProductEntity product}){
    if (products.contains(product) || productIds.contains(product.id)){
      return true;
    }
    return false;
  }

}
