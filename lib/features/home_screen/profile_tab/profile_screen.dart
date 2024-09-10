import 'package:flutter/material.dart';
import 'package:flutter_ecommerce_app/core/assets_manager/assets_manager.dart';
import 'package:flutter_ecommerce_app/core/color_manager/color_manager.dart';
import 'package:flutter_ecommerce_app/core/font_manager/font_manager.dart';
import 'package:flutter_ecommerce_app/core/style_manager/style_manager.dart';
import 'package:flutter_ecommerce_app/core/validator/validators.dart';
import 'package:flutter_ecommerce_app/core/values_manager/values_manager.dart';
import 'package:flutter_ecommerce_app/core/widgets/main_text_field.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProfileScreen extends StatefulWidget {
  ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final _formKey = GlobalKey<FormState>();

  TextEditingController fullNameController = TextEditingController();

  TextEditingController phoneController = TextEditingController();

  TextEditingController emailController = TextEditingController();

  TextEditingController passwordController = TextEditingController();

  bool _isPasswordReadOnly = true;

  bool _isFullNameReadOnly = true;

  bool _isEmailReadOnly = true;

  bool _isPhoneReadOnly = true;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(
            vertical: AppPadding.p20, horizontal: AppPadding.p12),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: AppSize.s15.h,
              ),
              MainTextField(
                borderColor: ColorManager.primaryColor,
                labelTextStyle: mediumTextStyle(color: ColorManager.darkPrimaryColor,fontSize: FontSize.s18),
                label: 'Your Full Name',
                hint: 'enter your full name',
                isObscured: false,
                textInputType: TextInputType.text,
                isReadOnly: _isFullNameReadOnly,
                validation: Validators.validateFullName,
                textEditingController: fullNameController,
                suffixIcon:  IconButton(
                    icon: Icon(Icons.mode_edit_rounded,size: AppSize.s20,color: _isFullNameReadOnly ? ColorManager.grey : ColorManager.primaryColor),
                    onPressed: (){
                      setState(() {
                        _isFullNameReadOnly = !_isFullNameReadOnly;
                      });
                    }),
              ),
              SizedBox(
                height: AppSize.s28.h,
              ),
              MainTextField(
                borderColor: ColorManager.primaryColor,
                labelTextStyle: mediumTextStyle(color: ColorManager.darkPrimaryColor,fontSize: FontSize.s18),
                label: 'Your E-mail address',
                hint: 'Enter your email',
                isObscured: false,
                textInputType: TextInputType.emailAddress,
                isReadOnly: _isEmailReadOnly,
                validation: Validators.validateEmail,
                textEditingController: emailController,
                suffixIcon: IconButton(
                    icon: Icon(Icons.mode_edit_rounded,size: AppSize.s20,color: _isFullNameReadOnly ? ColorManager.grey : ColorManager.primaryColor),
                    onPressed: (){
                      setState(() {
                        _isEmailReadOnly = !_isEmailReadOnly;
                      });
                    }),
              ),
              SizedBox(
                height: AppSize.s28.h,
              ),
              MainTextField(
                borderColor: ColorManager.primaryColor,
                labelTextStyle: mediumTextStyle(color: ColorManager.darkPrimaryColor,fontSize: FontSize.s18),
                label: 'Your Password',
                hint: 'Enter your password',
                isObscured: true,
                textInputType: TextInputType.text,
                isReadOnly: _isPasswordReadOnly,
                suffixIcon: IconButton(
                    icon: Icon(Icons.mode_edit_rounded,size: AppSize.s20,color: _isFullNameReadOnly ? ColorManager.grey : ColorManager.primaryColor),
                    onPressed: (){
                      setState(() {
                        _isPasswordReadOnly = !_isPasswordReadOnly;
                      });
                    }),
                validation: Validators.validatePassword,
                textEditingController: passwordController,

              ),

              SizedBox(
                height: AppSize.s28.h,
              ),

              MainTextField(
                borderColor: ColorManager.primaryColor,
                labelTextStyle: mediumTextStyle(color: ColorManager.darkPrimaryColor,fontSize: FontSize.s18),
                label: 'Your Mobile Number',
                hint: 'enter your mobile no.',
                isObscured: false,
                textInputType: TextInputType.phone,
                isReadOnly: _isPhoneReadOnly,
                validation: Validators.validatePhoneNumber,
                textEditingController: phoneController,
                suffixIcon: IconButton(
                    icon: Icon(Icons.mode_edit_rounded,size: AppSize.s20,color: _isFullNameReadOnly ? ColorManager.grey : ColorManager.primaryColor),
                    onPressed: (){
                      setState(() {
                        _isPhoneReadOnly = !_isPhoneReadOnly;
                      });
                    }),
              ),
              SizedBox(
                height: AppSize.s28.h,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
