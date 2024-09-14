
import 'package:dio/dio.dart';
import 'package:flutter_ecommerce_app/core/constants/app_constants.dart';
import 'package:injectable/injectable.dart';

@singleton
class ApiManager{
  late Dio dio;
  ApiManager(){
    dio = Dio();
  }

  Future<Response> get({required String entPoint , Map<String,dynamic>? queryParameters,Map<String,dynamic>? headers}) async{
    return await dio.get(ApiConstants.baseURL+entPoint,queryParameters: queryParameters,options: Options(headers: headers,validateStatus:(_){return true;} ));
  }

  Future<Response> post({required String entPoint , Map<String,dynamic>? body,Map<String,dynamic>? headers}) async{
    return await dio.post(ApiConstants.baseURL+entPoint,data: body,options: Options(headers: headers,validateStatus:(_){return true;} ));
  }

  Future<Response> delete({required String entPoint , Map<String,dynamic>? queryParameters,Map<String,dynamic>? headers}) async{
    return await dio.delete(ApiConstants.baseURL+entPoint,queryParameters: queryParameters,options: Options(headers: headers,validateStatus:(_){return true;} ));
  }

}