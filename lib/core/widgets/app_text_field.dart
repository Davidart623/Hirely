
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hirely/app/theme/app_colors.dart';







enum FieldState {
  normal,
  valid,
  error,

}



class EmailTextField extends StatefulWidget {
  const EmailTextField({
    super.key,
    required this.userController, this.validator, this.onChanged, this.borderColor, this.fieldState= FieldState.normal, this.onValidityChanged,
  });

  final TextEditingController userController;
  final String? Function(String?)? validator;
  final Function(String)? onChanged;
  final Color? borderColor;
  final FieldState fieldState;
  final Function(bool)? onValidityChanged;

  @override
  State<EmailTextField> createState() => _EmailTextFieldState();
}

class _EmailTextFieldState extends State<EmailTextField> {
  FieldState emailFieldState = FieldState.normal;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      cursorColor: AppColors.secondaryT,
      controller: widget.userController,
      keyboardType: TextInputType.emailAddress,
      onChanged: (value) {
        final emailRegex = RegExp(
          r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+",);
        setState(() {
          if (value.isEmpty) {
            emailFieldState = FieldState.normal;
          } else if (emailRegex.hasMatch(value)) {
            emailFieldState = FieldState.valid;
          } else {
            emailFieldState = FieldState.error;
          }
        });
        widget.onValidityChanged?.call(emailFieldState == FieldState.valid);
      },
      validator: (value){
        if (value==null || value.isEmpty) {
          return "Email is required";
        }
        final emailRegex = RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
        if (!emailRegex.hasMatch(value)) {
          return 'Email is incorrect';
        }
        return null;
      },
      decoration: InputDecoration(

        contentPadding: EdgeInsets.symmetric(
          horizontal:14.spMin,
          vertical: 10.spMin,
        ),
        hintText: "hello@email.com",
        hintStyle: TextStyle(fontWeight: FontWeight.w400, fontSize: 12.spMin, fontFamily: "Poppins", color: Color(0xff667085)),
        suffixIcon: emailFieldState == FieldState.valid
            ? Padding(
          padding: const EdgeInsets.all(12),
          child: SvgPicture.asset(
            height: 13.33.h,
            width: 13.33.w,
            fit: BoxFit.scaleDown,
            "assets/icons/checkmark-circle-02.svg",
          ),
        )
            : emailFieldState == FieldState.error
            ? Padding(
          padding: const EdgeInsets.all(12),
          child: SvgPicture.asset(
            "assets/icons/alert-circle.svg",
          ),
        )
            : null,
        border: OutlineInputBorder(
          borderSide:BorderSide(color: Color(0xffD0D5DD), width: 0.5.spMin),
          borderRadius: BorderRadius.circular(8.r),
        ),
        focusedBorder:OutlineInputBorder(
          borderSide: BorderSide(color:
          emailFieldState == FieldState.valid
              ? const Color(0xff008751)
              : emailFieldState == FieldState.error
              ? const Color(0xffFDA29B)
              : const Color(0xffD0D5DD),
              width: 0.5.spMin),
          borderRadius: BorderRadius.circular(8.r),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide:BorderSide( color:emailFieldState == FieldState.valid
              ? const Color(0xff008751)
              : emailFieldState == FieldState.error
              ? const Color(0xffFDA29B)
              : const Color(0xffD0D5DD),
            width: 0.5.spMin,
          ),
          borderRadius: BorderRadius.circular(8.r),
        ),
        errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8.r),
            borderSide: BorderSide(color: Color(0xffFDA29B), width: 0.5.spMin
            )
        ),
      ),
    );
  }
}











