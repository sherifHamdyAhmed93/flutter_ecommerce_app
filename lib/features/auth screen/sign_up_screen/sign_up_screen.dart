import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_ecommerce_app/core/assets_manager/assets_manager.dart';
import 'package:flutter_ecommerce_app/core/color_manager/color_manager.dart';
import 'package:flutter_ecommerce_app/core/font_manager/font_manager.dart';
import 'package:flutter_ecommerce_app/core/routes_manager/routes.dart';
import 'package:flutter_ecommerce_app/core/style_manager/style_manager.dart';
import 'package:flutter_ecommerce_app/core/validator/validators.dart';
import 'package:flutter_ecommerce_app/core/values_manager/values_manager.dart';
import 'package:flutter_ecommerce_app/core/widgets/alert_dialog.dart';
import 'package:flutter_ecommerce_app/core/widgets/custom_elevated_button.dart';
import 'package:flutter_ecommerce_app/core/widgets/main_text_field.dart';
import 'package:flutter_ecommerce_app/di/di.dart';
import 'package:flutter_ecommerce_app/features/auth%20screen/sign_up_screen/signup_view_model_cubit.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get_it/get_it.dart';

class SignUpScreen extends StatelessWidget {
   SignUpScreen({super.key});

   SignupViewModel viewModel = getIt<SignupViewModel>();
   final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {

   return BlocListener<SignupViewModel, SignupViewModelState>(
     bloc: viewModel,
      listener: (context, state) {
        if (state is SignupViewModelLoadingState){
          DialogUtils.showLoader(context: context, message: 'Loading...');
        }else if (state is SignupViewModelErrorState){
          DialogUtils.hideLoader(context);
          DialogUtils.showMessage(context: context, message: state.failure.errorMessage , posActionName: 'OK');
        }else if (state is SignupViewModelSuccessState){
          DialogUtils.hideLoader(context);
          DialogUtils.showMessage(context: context, message: 'Register Successfully' , posActionName: 'OK',posAction: (){
            Navigator.pushNamed(context, Routes.mainRoute);
          });
        }else{

        }
      },
      child: Scaffold(
      backgroundColor: ColorManager.primaryColor,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: AppPadding.p20,horizontal: AppPadding.p12),
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(child: Image.asset(ImagesAssets.logo)),
                  SizedBox(height: AppSize.s50.h,),
                  MainTextField(label: 'Full Name',hint: 'enter your full name',isObscured: false, textInputType: TextInputType.text, isReadOnly: false,validation: Validators.validateFullName,textEditingController: viewModel.fullNameController,),
                  SizedBox(height: AppSize.s28.h,),
                  MainTextField(label: 'Mobile Number',hint: 'enter your mobile no.',isObscured: false, textInputType: TextInputType.phone, isReadOnly: false,validation: Validators.validatePhoneNumber,textEditingController: viewModel.phoneController,),
                  SizedBox(height: AppSize.s28.h,),
                  MainTextField(label: 'E-mail address',hint: 'Enter your email',isObscured: false, textInputType: TextInputType.emailAddress, isReadOnly: false,validation: Validators.validateEmail,textEditingController: viewModel.emailController,),
                  SizedBox(height: AppSize.s28.h,),
                  MainTextField(label: 'Password',hint: 'Enter your password',isObscured: true, textInputType: TextInputType.text, isReadOnly: false,suffixIcon: Image.asset(ImagesAssets.eyeIcon),validation: Validators.validatePassword,textEditingController: viewModel.passwordController,),
                  SizedBox(height: AppSize.s15.h,),
                  MainTextField(label: 'Confirm Password',hint: 'Enter your confirm password',isObscured: true, textInputType: TextInputType.text, isReadOnly: false,suffixIcon: Image.asset(ImagesAssets.eyeIcon),validation: (value){
                    return Validators.validateConfirmPassword(value,viewModel.passwordController.text);
                  },textEditingController: viewModel.confirmPasswordController,),
                  SizedBox(height: AppSize.s40.h,),
                  CustomElevatedButton(label: 'Sign up',labelTextStyle: semiBoldTextStyle(color: ColorManager.primaryColor,fontSize: FontSize.s20),onTap: (){
                    if (_formKey.currentState?.validate() ?? false) {
                      viewModel.register();
                    }
                  },backgroundColor: ColorManager.white,),
                ],
              ),
            ),
          ),
        ),
      ),
    )
    );


  }
}
