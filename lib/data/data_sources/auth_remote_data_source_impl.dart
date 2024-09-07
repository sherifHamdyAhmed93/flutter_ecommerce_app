import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_ecommerce_app/core/constants/app_constants.dart';
import 'package:flutter_ecommerce_app/core/utils/shared_preference.dart';
import 'package:flutter_ecommerce_app/data/api_manager/api_manager.dart';
import 'package:flutter_ecommerce_app/data/auth_remote_data_source.dart';
import 'package:flutter_ecommerce_app/data/dto/failure.dart';
import 'package:flutter_ecommerce_app/data/dto/login_response_dto.dart';
import 'package:flutter_ecommerce_app/data/dto/register_response_dto.dart';
import 'package:flutter_ecommerce_app/domain/entities/login_response_entity.dart';
import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';

@Injectable(as: AuthRemoteDataSource)
class AuthRemoteDataSourceImpl extends AuthRemoteDataSource{
  ApiManager apiManager;
  AuthRemoteDataSourceImpl({required this.apiManager});

  @override
  Future<Either<Failure,RegisterResponseDto>> register(String fullName, String phoneNumber , String email , String password , String confirmPassword )async{

    List<ConnectivityResult> connectivity = await Connectivity().checkConnectivity();

    if (connectivity.contains(ConnectivityResult.wifi) || connectivity.contains(ConnectivityResult.mobile) ){
      Map<String,dynamic> json = {
        'name': fullName,
        'email': email,
        'password': password,
        'rePassword': confirmPassword,
        'phone': phoneNumber,

      };
      try{
        var response =  await apiManager.post(entPoint:Endpoints.register,body: json);
        var registerResponseDto = RegisterResponseDto.fromJson(response.data);
        if (response.statusCode! >= 200 && response.statusCode! <= 300){
          await SharedPreferenceUtil.saveData(key: SharedPreferencesConstants.token, data: registerResponseDto.token ?? '');
          return Right(registerResponseDto);
        }else{
          return Left(Failure(errorMessage: registerResponseDto.message ?? ''));
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
  Future<Either<Failure, LoginResponseEntity>> login(String email, String password) async{
    List<ConnectivityResult> connectivity = await Connectivity().checkConnectivity();

    if (connectivity.contains(ConnectivityResult.wifi) || connectivity.contains(ConnectivityResult.mobile) ){
      Map<String,dynamic> json = {
        'email': email,
        'password': password,
      };
      try{
        var response =  await apiManager.post(entPoint:Endpoints.signIn, body: json);
        var loginResponseDto = LoginResponseDto.fromJson(response.data);
        if (response.statusCode! >= 200 && response.statusCode! <= 300){
          await SharedPreferenceUtil.saveData(key: SharedPreferencesConstants.token, data: loginResponseDto.token ?? '');
          return Right(loginResponseDto);
        }else{
          return Left(Failure(errorMessage: loginResponseDto.message ?? ''));
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