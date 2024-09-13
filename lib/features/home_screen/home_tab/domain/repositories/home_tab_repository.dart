
import 'package:dartz/dartz.dart';
import 'package:flutter_ecommerce_app/data/dto/failure.dart';
import 'package:flutter_ecommerce_app/features/home_screen/home_tab/domain/entities/category_or_brand_response_entity.dart';

abstract class HomeTabRepository{
  Future<Either<Failure,CategoryOrBrandResponseEntity>> getHomeCategories();
  Future<Either<Failure,CategoryOrBrandResponseEntity>> getHomeBrands();
}