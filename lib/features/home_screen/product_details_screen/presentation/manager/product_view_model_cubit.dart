import 'package:bloc/bloc.dart';
import 'package:flutter_ecommerce_app/data/dto/failure.dart';
import 'package:flutter_ecommerce_app/features/home_screen/product_details_screen/domain/use_cases/product_use_case.dart';
import 'package:flutter_ecommerce_app/features/home_screen/products_tab/domain/entities/productsResponseEntity.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';

part 'product_view_model_state.dart';

@injectable
class ProductViewModel extends Cubit<ProductViewModelState> {

  ProductUseCase productUseCase;
  ProductEntity? product;

  ProductViewModel({required this.productUseCase}) : super(ProductViewModelInitial());

  void getProductDetails({required String productId}) async{
    var either = await productUseCase.getProductDetails(productId: productId);
    either.fold(
        (failure) => emit(ProductViewModelErrorState(failure: failure)),
        (response) {
          product = response.data;
          emit(ProductViewModelDataFetchedState(product: response.data!));
        }
    );
  }

}
