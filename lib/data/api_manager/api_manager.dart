
import 'package:dio/dio.dart';
import 'package:flutter_ecommerce_app/core/constants/app_constants.dart';
import 'package:injectable/injectable.dart';

@singleton
class ApiManager{
  late Dio dio;
  ApiManager(){
    dio = Dio();
  }

  Future<Response> get(String entPoint , Map<String,dynamic>? queryParameters) async{
    return await dio.get(ApiConstants.baseURL+entPoint,queryParameters: queryParameters,options: Options(validateStatus:(_){return true;} ));
  }

  Future<Response> post(String entPoint , Map<String,dynamic>? body) async{
    return await dio.post(ApiConstants.baseURL+entPoint,data: body,options: Options(validateStatus:(_){return true;} ));
  }

}