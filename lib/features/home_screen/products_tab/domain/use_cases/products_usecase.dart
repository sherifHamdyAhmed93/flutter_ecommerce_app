
import 'package:dartz/dartz.dart';
import 'package:flutter_ecommerce_app/data/dto/failure.dart';
import 'package:flutter_ecommerce_app/features/home_screen/products_tab/domain/entities/productsResponseEntity.dart';
import 'package:flutter_ecommerce_app/features/home_screen/products_tab/domain/repositories/products_tab_repository.dart';
import 'package:injectable/injectable.dart';

@injectable
class ProductsUseCase{
  ProductsTabRepository productsTabRepository;

  ProductsUseCase({required this.productsTabRepository});

  Future<Either<Failure,ProductsResponseEntity>> invoke({required int page}){
    return productsTabRepository.getProducts(page: page);
  }


}