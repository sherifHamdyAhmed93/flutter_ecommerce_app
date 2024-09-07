import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ecommerce_app/data/dto/failure.dart';
import 'package:flutter_ecommerce_app/domain/entities/register_response_entity.dart';
import 'package:flutter_ecommerce_app/domain/use_case/register_use_case.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';

part 'signup_view_model_state.dart';

@injectable
class SignupViewModel extends Cubit<SignupViewModelState> {

  RegisterUseCase registerUseCase;

  SignupViewModel({required this.registerUseCase}) : super(SignupViewModelInitial());

  TextEditingController fullNameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController emailController = TextEditingController();

  TextEditingController confirmPasswordController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

   Future<void> register() async {
    emit(SignupViewModelLoadingState());
    var either = await registerUseCase.register(fullNameController.text, phoneController.text, emailController.text, passwordController.text, confirmPasswordController.text);
    either.fold(
        (failure){
          emit(SignupViewModelErrorState(failure: failure));
        },
        (response){
          emit(SignupViewModelSuccessState(registerResponseEntity: response));
        }
    );
  }

  }
