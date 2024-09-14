part of 'wishlist_view_model.dart';

@immutable
sealed class WishlistViewModelState {}

final class WishlistViewModelInitial extends WishlistViewModelState {}

final class WishlistViewModelStateLoading extends WishlistViewModelState {}

final class WishlistViewModelStateError extends WishlistViewModelState {
  Failure error;
  WishlistViewModelStateError({required this.error});
}

final class WishlistViewModelStateDataFetched extends WishlistViewModelState {
  List<ProductEntity> products;
  WishlistViewModelStateDataFetched({required this.products});
}

abstract class WishListNavgitor{
  void showLoading();
  void hideLoading();
  void itemRemove(String itemName);
  void itemAdd(String itemName);
}