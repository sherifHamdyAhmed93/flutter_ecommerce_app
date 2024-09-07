import 'package:dartz/dartz.dart';
import 'package:flutter_ecommerce_app/data/dto/failure.dart';
import 'package:flutter_ecommerce_app/domain/entities/register_response_entity.dart';
import 'package:flutter_ecommerce_app/domain/repository/auth_repository.dart';
import 'package:injectable/injectable.dart';

@injectable
class RegisterUseCase{
  AuthRepository authRepository;
  RegisterUseCase({required this.authRepository});

  Future<Either<Failure,RegisterResponseEntity>> register(String fullName, String phoneNumber , String email , String password , String confirmPassword ){
    return authRepository.register(fullName, phoneNumber, email, password, confirmPassword);
  }


}