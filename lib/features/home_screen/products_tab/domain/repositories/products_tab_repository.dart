
import 'package:dartz/dartz.dart';
import 'package:flutter_ecommerce_app/data/dto/failure.dart';
import 'package:flutter_ecommerce_app/features/home_screen/products_tab/domain/entities/productsResponseEntity.dart';

abstract class ProductsTabRepository{
  Future<Either<Failure,ProductsResponseEntity>> getProducts({required int page} );
}