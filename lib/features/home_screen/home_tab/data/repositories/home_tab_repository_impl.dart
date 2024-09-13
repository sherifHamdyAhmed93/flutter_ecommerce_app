
import 'package:dartz/dartz.dart';
import 'package:flutter_ecommerce_app/data/dto/failure.dart';
import 'package:flutter_ecommerce_app/features/home_screen/home_tab/data/data_sources/home_tab_remote_data_source.dart';
import 'package:flutter_ecommerce_app/features/home_screen/home_tab/domain/entities/category_or_brand_response_entity.dart';
import 'package:flutter_ecommerce_app/features/home_screen/home_tab/domain/repositories/home_tab_repository.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: HomeTabRepository)
class HomeTabRepositoryImpl extends HomeTabRepository{

  HomeTabRemoteDataSource homeTabRemoteDataSource;

  HomeTabRepositoryImpl({required this.homeTabRemoteDataSource});

  @override
  Future<Either<Failure, CategoryOrBrandResponseEntity>> getHomeBrands() async{
    var either = await homeTabRemoteDataSource.getHomeBrands();

    return either.fold(
            (failure)=> Left(failure)
        , (response)=> Right(response) );

  }

  @override
  Future<Either<Failure, CategoryOrBrandResponseEntity>> getHomeCategories() async{
    var either = await homeTabRemoteDataSource.getHomeCategories();

    return either.fold(
            (failure)=> Left(failure)
        , (response)=> Right(response) );
  }

}