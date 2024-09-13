part of 'product_view_model_cubit.dart';

@immutable
sealed class ProductViewModelState {}

final class ProductViewModelInitial extends ProductViewModelState {}
final class ProductViewModelLoadingState extends ProductViewModelState {}
final class ProductViewModelErrorState extends ProductViewModelState {
  Failure failure;
  ProductViewModelErrorState({required this.failure});
}
final class ProductViewModelDataFetchedState extends ProductViewModelState {
  ProductEntity product;
  ProductViewModelDataFetchedState({required this.product});
}
