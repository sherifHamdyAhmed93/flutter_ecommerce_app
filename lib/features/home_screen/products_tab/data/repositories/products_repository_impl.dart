
import 'package:dartz/dartz.dart';
import 'package:flutter_ecommerce_app/data/dto/failure.dart';
import 'package:flutter_ecommerce_app/features/home_screen/home_tab/data/data_sources/home_tab_remote_data_source.dart';
import 'package:flutter_ecommerce_app/features/home_screen/home_tab/domain/entities/category_or_brand_response_entity.dart';
import 'package:flutter_ecommerce_app/features/home_screen/home_tab/domain/repositories/home_tab_repository.dart';
import 'package:flutter_ecommerce_app/features/home_screen/products_tab/data/data_sources/products_remote_data_source.dart';
import 'package:flutter_ecommerce_app/features/home_screen/products_tab/domain/entities/productsResponseEntity.dart';
import 'package:flutter_ecommerce_app/features/home_screen/products_tab/domain/repositories/products_tab_repository.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: ProductsTabRepository)
class ProductsRepositoryImpl extends ProductsTabRepository{

  ProductsRemoteDataSource productsRemoteDataSource;

  ProductsRepositoryImpl({required this.productsRemoteDataSource});

  @override
  Future<Either<Failure, ProductsResponseEntity>> getProducts({required int page}) async{
    var either = await productsRemoteDataSource.getProducts(page: page);

    return either.fold(
            (failure)=> Left(failure)
        , (response)=> Right(response) );

  }

}