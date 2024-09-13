import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ecommerce_app/data/dto/failure.dart';
import 'package:flutter_ecommerce_app/features/home_screen/home_tab/domain/entities/category_or_brand_response_entity.dart';
import 'package:flutter_ecommerce_app/features/home_screen/home_tab/domain/use_cases/home_brands_usecase.dart';
import 'package:injectable/injectable.dart';

part 'home_tab_brands_view_model_state.dart';

@injectable
class HomeTabBrandsViewModelCubit extends Cubit<HomeTabBrandsViewModelState> {
  HomeBrandsUseCase homeBrandsUseCase;
  HomeTabBrandsViewModelCubit({required this.homeBrandsUseCase}) : super(HomeTabBrandsViewModelInitial());

  List<CategoryOrBrandEntity> brands = [];

  void getBrands()async{
    emit(HomeTabViewModelLoadingBrands());
    var either = await homeBrandsUseCase.invoke();
    either.fold(
        (failure)=> emit(HomeTabViewModelBrandsError(error: failure)),
        (response){
          brands = response.data ?? [];
          emit(HomeTabViewModelBrandsFetched(categoryOrBrandResponseEntity: response));
        }
    );
  }
}
