class LoginResponseEntity {
  LoginResponseEntity({
      this.message, 
      this.user, 
      this.token,
  this.statusMsg});

  String? message;
  String? statusMsg;
  LoginUserEntity? user;
  String? token;
}

class LoginUserEntity {
  LoginUserEntity({
      this.name, 
      this.email,});

  String? name;
  String? email;
}