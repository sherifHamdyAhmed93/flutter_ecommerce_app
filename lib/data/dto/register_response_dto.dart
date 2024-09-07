import 'package:flutter_ecommerce_app/domain/entities/register_response_entity.dart';

class RegisterResponseDto extends RegisterResponseEntity {
  RegisterResponseDto({
    super.message,
    super.user,
    super.token,
  super.statusMsg});

  RegisterResponseDto.fromJson(dynamic json) {
    message = json['message'];
    user = json['user'] != null ? UserDTO.fromJson(json['user']) : null;
    token = json['token'];
    statusMsg = json['statusMsg'];
  }

}

class UserDTO extends UserEntity {
  String? role;

  UserDTO({
      super.name,
    super.email,
    this.role,});

  UserDTO.fromJson(dynamic json) {
    name = json['name'];
    email = json['email'];
    role = json['role'];
  }

}