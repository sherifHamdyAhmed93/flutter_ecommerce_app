
import 'package:dartz/dartz.dart';
import 'package:flutter_ecommerce_app/data/dto/failure.dart';
import 'package:flutter_ecommerce_app/features/home_screen/home_tab/domain/entities/category_or_brand_response_entity.dart';
import 'package:flutter_ecommerce_app/features/home_screen/home_tab/domain/repositories/home_tab_repository.dart';
import 'package:injectable/injectable.dart';

@injectable
class HomeBrandsUseCase{
  HomeTabRepository homeTabRepository;

  HomeBrandsUseCase({required this.homeTabRepository});

  Future<Either<Failure,CategoryOrBrandResponseEntity>> invoke(){
    return homeTabRepository.getHomeBrands();
  }


}