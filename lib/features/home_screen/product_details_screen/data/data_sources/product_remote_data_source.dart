import 'package:dartz/dartz.dart';
import 'package:flutter_ecommerce_app/data/dto/failure.dart';
import 'package:flutter_ecommerce_app/features/home_screen/product_details_screen/domain/entities/productResponseEntity.dart';

abstract class ProductRemoteDataSource{
  Future<Either<Failure,ProductResponseEntity>> getProductDetails({required String productId});
}