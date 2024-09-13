
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_ecommerce_app/core/constants/app_constants.dart';
import 'package:flutter_ecommerce_app/data/api_manager/api_manager.dart';
import 'package:flutter_ecommerce_app/data/dto/failure.dart';
import 'package:flutter_ecommerce_app/features/home_screen/home_tab/data/data_sources/home_tab_remote_data_source.dart';
import 'package:flutter_ecommerce_app/features/home_screen/home_tab/data/models/category_or_brand_response_dto.dart';
import 'package:flutter_ecommerce_app/features/home_screen/home_tab/domain/entities/category_or_brand_response_entity.dart';
import 'package:flutter_ecommerce_app/features/home_screen/products_tab/data/data_sources/products_remote_data_source.dart';
import 'package:flutter_ecommerce_app/features/home_screen/products_tab/data/models/productsResponseDto.dart';
import 'package:flutter_ecommerce_app/features/home_screen/products_tab/domain/entities/productsResponseEntity.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: ProductsRemoteDataSource)
class ProductsRemoteDataSourceImpl extends ProductsRemoteDataSource{

  ApiManager apiManager;

  ProductsRemoteDataSourceImpl({required this.apiManager});

  @override
  Future<Either<Failure, ProductsResponseDto>> getProducts({required int page}) async {
    List<ConnectivityResult> connectivity = await Connectivity().checkConnectivity();

    if (connectivity.contains(ConnectivityResult.wifi) || connectivity.contains(ConnectivityResult.mobile) ){
      try{
        Map<String,dynamic> query = {'page' : page};
        var response =  await apiManager.get(entPoint:Endpoints.products,queryParameters: query);
        var categoriesResponseDto = ProductsResponseDto.fromJson(response.data);
        if (response.statusCode! >= 200 && response.statusCode! <= 300){
          return Right(categoriesResponseDto);
        }else{
          return Left(Failure(errorMessage: categoriesResponseDto.message ?? ''));
        }
      }catch (error){
        print(error.toString());
        return Left(Failure(errorMessage: error.toString()));

      }
    }else{
      return Left(NetworkError(errorMessage: 'Check your internet connection and try again'));
    }
  }



}