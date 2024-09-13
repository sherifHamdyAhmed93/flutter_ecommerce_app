
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_ecommerce_app/core/constants/app_constants.dart';
import 'package:flutter_ecommerce_app/data/api_manager/api_manager.dart';
import 'package:flutter_ecommerce_app/data/dto/failure.dart';
import 'package:flutter_ecommerce_app/features/home_screen/product_details_screen/data/data_sources/product_remote_data_source.dart';
import 'package:flutter_ecommerce_app/features/home_screen/product_details_screen/data/models/productResponseDTO.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: ProductRemoteDataSource)
class ProductRemoteDataSourceImpl extends ProductRemoteDataSource{
  
  ApiManager apiManager;
  
  ProductRemoteDataSourceImpl({required this.apiManager});
  @override
  Future<Either<Failure, ProductResponseDto>> getProductDetails({required String productId}) async{
    List<ConnectivityResult> connectivity = await Connectivity().checkConnectivity();

    if (connectivity.contains(ConnectivityResult.wifi) || connectivity.contains(ConnectivityResult.mobile) ){
      try{
        var response =  await apiManager.get(entPoint:"${Endpoints.productDetails}/$productId");
        var productResponseDto = ProductResponseDto.fromJson(response.data);
        if (response.statusCode! >= 200 && response.statusCode! <= 300){
          return Right(productResponseDto);
        }else{
          return Left(Failure(errorMessage: productResponseDto.message ?? ''));
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