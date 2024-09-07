import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ecommerce_app/data/dto/failure.dart';
import 'package:flutter_ecommerce_app/domain/entities/login_response_entity.dart';
import 'package:flutter_ecommerce_app/domain/use_case/login_use_case.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';

part 'login_view_model_state.dart';

@injectable
class LoginViewModel extends Cubit<LoginViewModelState> {

  LoginUseCase loginUseCase;

  LoginViewModel({required this.loginUseCase}) : super(LoginViewModelInitial());

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

   Future<void> login() async {
    emit(LoginViewModelLoadingState());
    var either = await loginUseCase.login(emailController.text, passwordController.text);
    either.fold(
        (failure){
          emit(LoginViewModelErrorState(failure: failure));
        },
        (response){
          emit(LoginViewModelSuccessState(loginResponseEntity: response));
        }
    );
  }

  }
