part of 'login_view_model_cubit.dart';

@immutable
sealed class LoginViewModelState {}

final class LoginViewModelInitial extends LoginViewModelState {}
final class LoginViewModelLoadingState extends LoginViewModelState {}
final class LoginViewModelErrorState extends LoginViewModelState {
  Failure failure;
  LoginViewModelErrorState({required this.failure});
}
final class LoginViewModelSuccessState extends LoginViewModelState {
  LoginResponseEntity loginResponseEntity;
  LoginViewModelSuccessState({required this.loginResponseEntity});
}
