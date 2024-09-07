import 'package:flutter_ecommerce_app/domain/entities/login_response_entity.dart';

class LoginResponseDto extends LoginResponseEntity {
  LoginResponseDto({
    super.message,
    super.user,
    super.token,
  super.statusMsg});

  LoginResponseDto.fromJson(dynamic json) {
    message = json['message'];
    user = json['user'] != null ? LoginUserDTO.fromJson(json['user']) : null;
    token = json['token'];
    statusMsg = json['statusMsg'];
  }

}

class LoginUserDTO extends LoginUserEntity {
  String? role;

  LoginUserDTO({
      super.name,
    super.email,
    this.role,});

  LoginUserDTO.fromJson(dynamic json) {
    name = json['name'];
    email = json['email'];
    role = json['role'];
  }

}