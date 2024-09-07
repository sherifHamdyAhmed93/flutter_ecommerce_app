import 'package:dartz/dartz.dart';
import 'package:flutter_ecommerce_app/data/dto/failure.dart';
import 'package:flutter_ecommerce_app/domain/entities/login_response_entity.dart';
import 'package:flutter_ecommerce_app/domain/entities/register_response_entity.dart';

abstract class AuthRemoteDataSource{
  Future<Either<Failure,RegisterResponseEntity>> register(String fullName, String phoneNumber , String email , String password , String confirmPassword );
  Future<Either<Failure,LoginResponseEntity>> login(String email , String password );
}