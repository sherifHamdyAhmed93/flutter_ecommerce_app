part of 'signup_view_model_cubit.dart';

@immutable
sealed class SignupViewModelState {}

final class SignupViewModelInitial extends SignupViewModelState {}
final class SignupViewModelLoadingState extends SignupViewModelState {}
final class SignupViewModelErrorState extends SignupViewModelState {
  Failure failure;
  SignupViewModelErrorState({required this.failure});
}
final class SignupViewModelSuccessState extends SignupViewModelState {
  RegisterResponseEntity registerResponseEntity;
  SignupViewModelSuccessState({required this.registerResponseEntity});
}
