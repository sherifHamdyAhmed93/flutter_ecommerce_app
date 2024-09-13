import 'package:bloc/bloc.dart';
import 'package:flutter_ecommerce_app/data/dto/failure.dart';
import 'package:flutter_ecommerce_app/features/home_screen/products_tab/domain/entities/productsResponseEntity.dart';
import 'package:flutter_ecommerce_app/features/home_screen/products_tab/domain/use_cases/products_usecase.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';

part 'products_view_model_state.dart';

@injectable
class ProductsViewModelCubit extends Cubit<ProductsViewModelState> {
  int page = 1;
  int maxPage = 1;
  List<ProductEntity> products = [];
  ProductsUseCase productsUseCase;
  ProductsViewModelCubit({required this.productsUseCase}) : super(ProductsViewModelInitial());

  void getProducts() async{
    if (page == 1) {
      emit(ProductsViewModelStateLoading());
    }
    print('Load products at page ${page}');
    var either = await productsUseCase.invoke(page: page);
    either.fold(
            (failure)=> emit(ProductsViewModelStateError(error: failure)),
            (response){
              if (page == 1) {
                maxPage = response.metadata!.numberOfPages!.toInt() ?? 1;
                products = response.products ?? [];
              }else{
                products.addAll(response.products ?? []);
              }
          emit(ProductsViewModelStateDataFetched(products: products));
        }
    );
  }

  void loadMore() {
    if (maxPage == page){
      print('No Data To Load');
      return;
    }
    page += 1;
    emit(ProductsViewModelStateLoadMoreData());
    getProducts();
  }

}
