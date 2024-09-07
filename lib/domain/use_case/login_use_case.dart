import 'package:dartz/dartz.dart';
import 'package:flutter_ecommerce_app/data/dto/failure.dart';
import 'package:flutter_ecommerce_app/domain/entities/login_response_entity.dart';
import 'package:flutter_ecommerce_app/domain/repository/auth_repository.dart';
import 'package:injectable/injectable.dart';

@injectable
class LoginUseCase{
  AuthRepository authRepository;
  LoginUseCase({required this.authRepository});

  Future<Either<Failure,LoginResponseEntity>> login(String email , String password ){
    return authRepository.login(email, password);
  }


}