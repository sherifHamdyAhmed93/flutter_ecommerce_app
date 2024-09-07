import 'package:dartz/dartz.dart';
import 'package:flutter_ecommerce_app/data/auth_remote_data_source.dart';
import 'package:flutter_ecommerce_app/data/dto/failure.dart';
import 'package:flutter_ecommerce_app/data/dto/register_response_dto.dart';
import 'package:flutter_ecommerce_app/domain/entities/login_response_entity.dart';
import 'package:flutter_ecommerce_app/domain/entities/register_response_entity.dart';
import 'package:flutter_ecommerce_app/domain/repository/auth_repository.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: AuthRepository)
class AuthRepositoryImpl extends AuthRepository{

  AuthRemoteDataSource authRemoteDataSource;

  AuthRepositoryImpl({required this.authRemoteDataSource});

  @override
  Future<Either<Failure, RegisterResponseEntity>> register(String fullName, String phoneNumber, String email, String password, String confirmPassword) async{
    var either =  await authRemoteDataSource.register(fullName, phoneNumber, email, password, confirmPassword);
    return either.fold(
            (failure){return Left(failure);},
            (response){return Right(response);}
    );
  }

  @override
  Future<Either<Failure, LoginResponseEntity>> login(String email, String password) async{
    var either =  await authRemoteDataSource.login(email, password);
    return either.fold(
            (failure){return Left(failure);},
            (response){return Right(response);}
    );
  }


}