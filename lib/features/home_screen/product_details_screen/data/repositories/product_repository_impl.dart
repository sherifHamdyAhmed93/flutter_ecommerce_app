
import 'package:dartz/dartz.dart';
import 'package:flutter_ecommerce_app/data/dto/failure.dart';
import 'package:flutter_ecommerce_app/features/home_screen/product_details_screen/data/data_sources/product_remote_data_source.dart';
import 'package:flutter_ecommerce_app/features/home_screen/product_details_screen/domain/entities/productResponseEntity.dart';
import 'package:flutter_ecommerce_app/features/home_screen/product_details_screen/domain/repositories/product_repository.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: ProductRepository)
class  ProductRepositoryImpl extends ProductRepository{

  ProductRemoteDataSource productRemoteDataSource;

  ProductRepositoryImpl({required this.productRemoteDataSource});

  @override
  Future<Either<Failure, ProductResponseEntity>> getProductDetails({required String productId}) async{
    var either = await productRemoteDataSource.getProductDetails(productId: productId);
    return either.fold(
        (failure)  => Left(failure),
        (response) => Right(response)
    );
  }

}