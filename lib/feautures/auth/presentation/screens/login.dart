import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hirely/app/app_route.dart';
import 'package:hirely/app/theme/app_colors.dart';
import 'package:hirely/core/widgets/app_text_field.dart';
import 'package:hirely/core/widgets/custom_app_bar.dart';
import 'package:hirely/core/widgets/password_field.dart';
import '../../../../core/widgets/app_button.dart';
import '../../../../core/widgets/d_text.dart';
import '../widgets/rich_text_widget.dart';
import '../widgets/sign_in_container.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}
class _LoginState extends State<Login> {
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  bool _isEmailValid = false;
  bool _isPasswordFilled = false;

  bool get _canSubmit => _isEmailValid && _isPasswordFilled;

  void _setEmailValid(bool isValid) {
    if (isValid != _isEmailValid) {
      setState(() => _isEmailValid = isValid);
    }
  }

  void _setPasswordFilled(String value) {
    final isFilled = value.isNotEmpty;
    if (isFilled != _isPasswordFilled) {
      setState(() => _isPasswordFilled = isFilled);
    }
  }

  @override
  void dispose() {
    passwordController.dispose();
    emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 18.0),
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
                  DText(inputText: "Welcome Back 👋", size: 24.spMin, weight: FontWeight.w600, textColor: AppColors.secondaryT,),
                  SizedBox(height: 7.h),
                  DText(inputText: "Let’s log in. Apply to jobs!", size: 14.spMin, weight: FontWeight.w400, textColor: AppColors.boderC,),
                  SizedBox(height: 51.h),
                  DText(inputText: "Email", size: 14.spMin, weight: FontWeight.w500, textColor: AppColors.eColor,),
                  SizedBox(height: 6.h),
                  EmailTextField(userController: emailController, onValidityChanged: _setEmailValid,),
                  SizedBox(height: 16.h),
                  PasswordField(
                    controller: passwordController,
                    onChanged: _setPasswordFilled,
                  ),
                  SizedBox(height: 32.h),
                  AppButton(
                    title: "Log in",
                    isPrimary: _canSubmit,
                    onPressed: () {
                      if (!_canSubmit) return;
                      if (_formKey.currentState!.validate()) {
                        Navigator.pushNamed(context, AppRoute.dashboardScreen);
                      }
                    },
                  ),
                  SizedBox(height: 40.h),
                  Center(child: DText(inputText: "Forgot Password?", size: 14.spMin, weight: FontWeight.w500, textColor: AppColors.primary,),),
                  SizedBox(height: 48.h),
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
                  SizedBox(height: 48.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SignC(),
                      SizedBox(width: 24.w),
                      SignC(icon: "assets/icons/flat-color-icons_google.svg",),
                      SizedBox(width: 24.w),
                      SignC(icon: "assets/icons/ion_logo-facebook.svg"),],),
                  SizedBox(height: 48.h,),
                  Center(
                    child: RichTextW(leadingText: "Don't have an account? ", actionText: "Register", onActionTap: () { Navigator.pushNamed(context, AppRoute.signUp);  },),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}


