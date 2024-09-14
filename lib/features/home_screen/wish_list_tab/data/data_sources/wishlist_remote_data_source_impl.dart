
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_ecommerce_app/core/constants/app_constants.dart';
import 'package:flutter_ecommerce_app/core/utils/shared_preference.dart';
import 'package:flutter_ecommerce_app/data/api_manager/api_manager.dart';
import 'package:flutter_ecommerce_app/data/dto/failure.dart';
import 'package:flutter_ecommerce_app/features/home_screen/home_tab/data/data_sources/home_tab_remote_data_source.dart';
import 'package:flutter_ecommerce_app/features/home_screen/home_tab/data/models/category_or_brand_response_dto.dart';
import 'package:flutter_ecommerce_app/features/home_screen/home_tab/domain/entities/category_or_brand_response_entity.dart';
import 'package:flutter_ecommerce_app/features/home_screen/wish_list_tab/data/data_sources/wishlist_remote_data_source.dart';
import 'package:flutter_ecommerce_app/features/home_screen/products_tab/data/models/productsResponseDto.dart';
import 'package:flutter_ecommerce_app/features/home_screen/products_tab/domain/entities/productsResponseEntity.dart';
import 'package:flutter_ecommerce_app/features/home_screen/wish_list_tab/data/models/wishlist_add_or_remove_response_dto.dart';
import 'package:flutter_ecommerce_app/features/home_screen/wish_list_tab/data/models/wishlist_response_dto.dart';
import 'package:flutter_ecommerce_app/features/home_screen/wish_list_tab/domain/entities/wishlist_add_or_remove_response_entity.dart';
import 'package:flutter_ecommerce_app/features/home_screen/wish_list_tab/domain/entities/wishlist_response_entity.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: WishlistRemoteDataSource)
class WishlistRemoteDataSourceImpl extends WishlistRemoteDataSource{

  ApiManager apiManager;

  WishlistRemoteDataSourceImpl({required this.apiManager});

  @override
  Future<Either<Failure, WishlistAddOrRemoveResponseDto>> addToWishList({required String productId}) async{
    List<ConnectivityResult> connectivity = await Connectivity().checkConnectivity();

    if (connectivity.contains(ConnectivityResult.wifi) || connectivity.contains(ConnectivityResult.mobile) ){
      try{
        Map<String,dynamic> query = {'productId' : productId};
        String token = SharedPreferenceUtil.getData(key: SharedPreferencesConstants.token) as String;
        Map<String,dynamic> headers = {'token' : token};

        var response =  await apiManager.post(entPoint:Endpoints.addToWishlist,body: query,headers: headers);
        var wishlistResponseDto = WishlistAddOrRemoveResponseDto.fromJson(response.data);
        if (response.statusCode! >= 200 && response.statusCode! <= 300){
          return Right(wishlistResponseDto);
        }else{
          return Left(Failure(errorMessage: wishlistResponseDto.message ?? ''));
        }
      }catch (error){
        print(error.toString());
        return Left(Failure(errorMessage: error.toString()));

      }
    }else{
      return Left(NetworkError(errorMessage: 'Check your internet connection and try again'));
    }
  }

  @override
  Future<Either<Failure, WishlistResponseDto>> getWishlist() async{
    List<ConnectivityResult> connectivity = await Connectivity().checkConnectivity();

    if (connectivity.contains(ConnectivityResult.wifi) || connectivity.contains(ConnectivityResult.mobile) ){
      try{
        String token = SharedPreferenceUtil.getData(key: SharedPreferencesConstants.token) as String;
        Map<String,dynamic> headers = {'token' : token};
        var response =  await apiManager.get(entPoint:Endpoints.wishlist,headers: headers);
        var wishlistResponseDto = WishlistResponseDto.fromJson(response.data);
        if (response.statusCode! >= 200 && response.statusCode! <= 300){
          return Right(wishlistResponseDto);
        }else{
          return Left(Failure(errorMessage: wishlistResponseDto.message ?? ''));
        }
      }catch (error){
        print(error.toString());
        return Left(Failure(errorMessage: error.toString()));

      }
    }else{
      return Left(NetworkError(errorMessage: 'Check your internet connection and try again'));
    }
  }

  @override
  Future<Either<Failure, WishlistAddOrRemoveResponseDto>> removeFromWishlist({required String productId}) async{
    List<ConnectivityResult> connectivity = await Connectivity().checkConnectivity();

    if (connectivity.contains(ConnectivityResult.wifi) || connectivity.contains(ConnectivityResult.mobile) ){
      try{
        Map<String,dynamic> query = {'productId' : productId};
        String token = SharedPreferenceUtil.getData(key: SharedPreferencesConstants.token) as String;
        Map<String,dynamic> headers = {'token' : token};

        var response =  await apiManager.delete(entPoint:'${Endpoints.removeFromWishlist}/$productId',headers: headers);
        var wishlistResponseDto = WishlistAddOrRemoveResponseDto.fromJson(response.data);
        if (response.statusCode! >= 200 && response.statusCode! <= 300){
          return Right(wishlistResponseDto);
        }else{
          return Left(Failure(errorMessage: wishlistResponseDto.message ?? ''));
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