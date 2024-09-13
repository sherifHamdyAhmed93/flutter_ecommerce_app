
import 'package:dartz/dartz.dart';
import 'package:flutter_ecommerce_app/data/dto/failure.dart';
import 'package:flutter_ecommerce_app/features/home_screen/product_details_screen/domain/entities/productResponseEntity.dart';
import 'package:flutter_ecommerce_app/features/home_screen/product_details_screen/domain/repositories/product_repository.dart';
import 'package:injectable/injectable.dart';

@injectable
class ProductUseCase{
  ProductRepository productRepository;
  ProductUseCase({required this.productRepository});

  Future<Either<Failure,ProductResponseEntity>> getProductDetails({required String productId}) async{
   return productRepository.getProductDetails(productId: productId);
  }

}