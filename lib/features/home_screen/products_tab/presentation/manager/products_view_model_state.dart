part of 'products_view_model_cubit.dart';

@immutable
sealed class ProductsViewModelState {}

final class ProductsViewModelInitial extends ProductsViewModelState {}

final class ProductsViewModelStateLoading extends ProductsViewModelState {}

final class ProductsViewModelStateError extends ProductsViewModelState {
  Failure error;
  ProductsViewModelStateError({required this.error});
}

final class ProductsViewModelStateDataFetched extends ProductsViewModelState {
  List<ProductEntity> products;
  ProductsViewModelStateDataFetched({required this.products});
}

final class ProductsViewModelStateLoadMoreData extends ProductsViewModelState {
  ProductsViewModelStateLoadMoreData();
}
