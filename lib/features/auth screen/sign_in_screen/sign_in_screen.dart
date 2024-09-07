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
import 'package:flutter_ecommerce_app/features/auth%20screen/sign_in_screen/login_view_model_cubit.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SignInScreen extends StatelessWidget {
   SignInScreen({super.key});

  LoginViewModel viewModel = getIt<LoginViewModel>();
   final _formKey = GlobalKey<FormState>();


  @override
  Widget build(BuildContext context) {

    return BlocListener<LoginViewModel, LoginViewModelState>(
        bloc: viewModel,
        listener: (context, state) {
          if (state is LoginViewModelLoadingState){
            DialogUtils.showLoader(context: context, message: 'Loading...');
          }else if (state is LoginViewModelErrorState){
            DialogUtils.hideLoader(context);
            DialogUtils.showMessage(context: context, message: state.failure.errorMessage , posActionName: 'OK');
          }else if (state is LoginViewModelSuccessState){
            DialogUtils.hideLoader(context);
            DialogUtils.showMessage(context: context, message: 'Login Successfully' , posActionName: 'OK',posAction: (){
              Navigator.pushReplacementNamed(
                context,
                Routes.mainRoute,  // Replace with your main route
              );
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
                      Text('Welcome Back to route',style: semiBoldTextStyle(color: ColorManager.white,fontSize: FontSize.s24.sp),),
                      Text('Please sign in with your mail',style: lightTextStyle(color: ColorManager.white,fontSize: FontSize.s16.sp),),
                      SizedBox(height: AppSize.s28.h,),
                      MainTextField(label: 'User Name',hint: 'Enter your email',isObscured: false, textInputType: TextInputType.emailAddress, isReadOnly: false,validation: Validators.validateEmail,textEditingController: viewModel.emailController,),
                      SizedBox(height: AppSize.s28.h,),
                      MainTextField(label: 'Password',hint: 'Enter your password',isObscured: true, textInputType: TextInputType.text, isReadOnly: false,suffixIcon: Image.asset(ImagesAssets.eyeIcon),validation: Validators.validatePassword,textEditingController: viewModel.passwordController,),
                      SizedBox(height: AppSize.s15.h,),
                      Row(children: [
                        Spacer(),
                        GestureDetector(child: Text('Forgot password',style: regularTextStyle(color: ColorManager.white,fontSize: FontSize.s18.sp),))
                      ]),
                      SizedBox(height: AppSize.s40.h,),
                      CustomElevatedButton(label: 'Login',labelTextStyle: semiBoldTextStyle(color: ColorManager.primaryColor,fontSize: FontSize.s20),onTap: (){
                        if (_formKey.currentState?.validate() ?? false) {
                          viewModel.login();
                        }
                      },backgroundColor: ColorManager.white,),
                      SizedBox(height: AppSize.s28.h,),
                      Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text('Don’t have an account?',style: mediumTextStyle(color: ColorManager.white,fontSize: FontSize.s18.sp),),
                            SizedBox(width: AppSize.s2.w,),
                            GestureDetector(child: Text('Create Account',style: mediumTextStyle(color: ColorManager.white,fontSize: FontSize.s18.sp),))
                          ]),
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
