import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hirely/app/app_route.dart';
import 'package:hirely/app/theme/app_colors.dart';
import 'package:hirely/core/widgets/app_button.dart';
import 'package:hirely/feautures/auth/presentation/widgets/name_text_field.dart';
import 'package:hirely/feautures/auth/presentation/widgets/rich_text_widget.dart';

import '../../../../core/widgets/app_text_field.dart';
import '../../../../core/widgets/custom_app_bar.dart';
import '../../../../core/widgets/d_text.dart';
import '../../../../core/widgets/password_field.dart';
import '../../../../core/widgets/password_text_field.dart';
import '../widgets/sign_in_container.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  bool _isNameValid = false;
  bool _isEmailValid = false;
  bool _isPasswordValid = false;
  bool _isConfirmPasswordValid = false;
  bool _showPasswordMismatch = false;


  bool get _canSubmit =>
      _isNameValid && _isEmailValid && _isPasswordValid && _isConfirmPasswordValid;

  @override
  void initState() {
    super.initState();
    nameController.addListener(_checkName);
    confirmPasswordController.addListener(_checkConfirmPassword);
  }

  void _checkName() {
    final isValid = nameController.text.trim().isNotEmpty;
    if (isValid != _isNameValid) {
      setState(() => _isNameValid = isValid);
    }
  }

  void _setEmailValid(bool isValid) {
    if (isValid != _isEmailValid) {
      setState(() => _isEmailValid = isValid);
    }
  }

  void _setPasswordValid(bool isValid) {
    if (isValid != _isPasswordValid) {
      setState(() => _isPasswordValid = isValid);
    }
    _checkConfirmPassword();
  }
  void _checkConfirmPassword() {
    final confirmText = confirmPasswordController.text;
    final isValid = confirmText.isNotEmpty && confirmText == passwordController.text;

    if (isValid != _isConfirmPasswordValid) {
      setState(() => _isConfirmPasswordValid = isValid);
    }

    final shouldShowError = confirmText.isNotEmpty && !isValid;
    if (shouldShowError != _showPasswordMismatch) {
      setState(() => _showPasswordMismatch = shouldShowError);
    }
  }

  @override
  void dispose() {
    nameController.removeListener(_checkName);
    confirmPasswordController.removeListener(_checkConfirmPassword);
    nameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColors.backgroundColor,
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 18.0.w),
            child: SingleChildScrollView(
              child: Form(
                key: _formKey,
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 16.h),
                      CustomAppBar(),
                      SizedBox(height: 22.h),
                      DText(inputText: "Hirely", size: 22.spMin, weight: FontWeight.w600, textColor: AppColors.primary,),

                      SizedBox(height: 8.h),
                      DText(inputText: "Registration 👍", size: 24.spMin, weight: FontWeight.w600, textColor: AppColors.secondaryT),
                      SizedBox(height: 7.h),
                      DText(inputText: "Let’s Register. Apply to jobs!", size: 14.spMin, weight: FontWeight.w400, textColor: AppColors.boderC,),
                      SizedBox(height: 31.h),
                      DText(inputText: "Full Name", size: 14.spMin, weight: FontWeight.w500, textColor: AppColors.eColor,),
                      SizedBox(height: 6.h),
                      NameTextField(userController: nameController),
                      SizedBox(height: 16.h),
                      DText(inputText: "Email", size: 14.spMin, weight: FontWeight.w500, textColor: AppColors.eColor,),
                      SizedBox(height: 6.h),
                      EmailTextField(
                        userController: emailController,
                        onValidityChanged: _setEmailValid,
                      ),
                      SizedBox(height: 16.h),
                      Password(
                        password: passwordController,
                        onValidityChanged: _setPasswordValid,
                      ),
                      SizedBox(height: 16.h),
                      SizedBox(height: 6.h),
                      PasswordField(
                        controller: confirmPasswordController,
                        label: "Confirm Password",
                        onChanged: (_) => _checkConfirmPassword(),
                      ),
                      if (_showPasswordMismatch) ...[
                        SizedBox(height: 4.h),
                        DText(
                          inputText: "Passwords do not match",
                          size: 12.spMin,
                          weight: FontWeight.w400,
                          textColor: Color(0xffFDA29B),
                        ),
                      ],
                      SizedBox(height: 32.h,),
                      AppButton(
                        isPrimary: _canSubmit,
                        onPressed: () {
                          if (!_canSubmit) return;
                          if (_formKey.currentState!.validate()) {
                            Navigator.pushNamed(context, AppRoute.login);
                          }
                        },
                      ),
                      SizedBox(height: 32.h,),
                      Row(
                        children: [
                          Expanded(
                            child: Divider(
                              color: AppColors.boderC,
                              thickness: 0,
                              endIndent: 5,
                            ),
                          ),
                          DText(inputText: "Or continue with", size: 13.spMin, textColor: AppColors.boderC, weight: FontWeight.w300,),
                          Expanded(
                            child: Divider(
                              color: AppColors.boderC,
                              thickness: 0,
                              indent: 5,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 10.h),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SignC(),
                          SizedBox(width: 24.w),
                          SignC(icon: "assets/icons/flat-color-icons_google.svg",),
                          SizedBox(width: 24.w),
                          SignC(icon: "assets/icons/ion_logo-facebook.svg"),],),
                      Center(
                        child: RichTextW(leadingText: "Have an account? ", actionText: " Log in", onActionTap: (){Navigator.pushNamed(context, AppRoute.login);}),
                      ),
                    ]
                ),
              ),
            ),
          ),
        )
    );
  }
}