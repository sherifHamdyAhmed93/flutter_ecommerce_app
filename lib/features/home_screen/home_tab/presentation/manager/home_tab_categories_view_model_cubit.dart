import 'package:bloc/bloc.dart';
import 'package:flutter_ecommerce_app/data/dto/failure.dart';
import 'package:flutter_ecommerce_app/features/home_screen/home_tab/domain/entities/category_or_brand_response_entity.dart';
import 'package:flutter_ecommerce_app/features/home_screen/home_tab/domain/use_cases/home_categories_usecase.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';

part 'home_tab_categories_view_model_state.dart';

@injectable
class HomeTabCategoriesViewModelCubit extends Cubit<HomeTabCategoriesViewModelState> {
  HomeCategoriesUseCase homeCategoriesUseCase;
  HomeTabCategoriesViewModelCubit({required this.homeCategoriesUseCase}) : super(HomeTabCategoriesViewModelInitial());

  List<CategoryOrBrandEntity> categories = [];

  void getCategories()async{
    emit(HomeTabViewModelLoadingCategories());
    var either = await homeCategoriesUseCase.invoke();
    either.fold(
        (failure)=> emit(HomeTabViewModelCategoriesError(error: failure)),
        (response){
          categories = response.data ?? [];
          emit(HomeTabViewModelCategoriesFetched(categoryOrBrandResponseEntity: response));
        }
    );
  }
}
