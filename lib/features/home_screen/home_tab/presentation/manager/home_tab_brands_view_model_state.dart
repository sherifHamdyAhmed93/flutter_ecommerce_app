part of 'home_tab_brands_view_model_cubit.dart';

@immutable
sealed class HomeTabBrandsViewModelState {}

final class HomeTabBrandsViewModelInitial extends HomeTabBrandsViewModelState {}

final class HomeTabViewModelLoadingBrands extends HomeTabBrandsViewModelState {}
final class HomeTabViewModelBrandsError extends HomeTabBrandsViewModelState {
  Failure  error;
  HomeTabViewModelBrandsError({required this.error});
}
final class HomeTabViewModelBrandsFetched extends HomeTabBrandsViewModelState {
  CategoryOrBrandResponseEntity  categoryOrBrandResponseEntity;
  HomeTabViewModelBrandsFetched({required this.categoryOrBrandResponseEntity});
}
