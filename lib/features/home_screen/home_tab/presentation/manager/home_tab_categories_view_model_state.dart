part of 'home_tab_categories_view_model_cubit.dart';

@immutable
sealed class HomeTabCategoriesViewModelState {}

final class HomeTabCategoriesViewModelInitial extends HomeTabCategoriesViewModelState {}

final class HomeTabViewModelLoadingCategories extends HomeTabCategoriesViewModelState {}
final class HomeTabViewModelCategoriesError extends HomeTabCategoriesViewModelState {
  Failure  error;
  HomeTabViewModelCategoriesError({required this.error});
}
final class HomeTabViewModelCategoriesFetched extends HomeTabCategoriesViewModelState {
  CategoryOrBrandResponseEntity  categoryOrBrandResponseEntity;
  HomeTabViewModelCategoriesFetched({required this.categoryOrBrandResponseEntity});
}
