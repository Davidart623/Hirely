import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hirely/app/theme/app_colors.dart';

class NameTextField extends StatelessWidget {
  const NameTextField({
    super.key,
    required this.userController,
    this.validator,
    this.onChanged,
    this.hintText = "David Tzolis",
  });

  final TextEditingController userController;
  final String? Function(String?)? validator;
  final Function(String)? onChanged;
  final String hintText;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      cursorColor: AppColors.secondaryT,
      controller: userController,
      keyboardType: TextInputType.name,
      textCapitalization: TextCapitalization.words,
      onChanged: onChanged,
      validator: validator ??
              (value) {
            if (value == null || value.trim().isEmpty) {
              return "Name is required";
            }
            return null;
          },
      decoration: InputDecoration(

        contentPadding: EdgeInsets.symmetric(
          horizontal: 14.spMin,
          vertical: 10.spMin,
        ),
        hintText: hintText,
        hintStyle: TextStyle(
          fontWeight: FontWeight.w400,
          fontSize: 12.spMin,
          fontFamily: "Poppins",
          color: const Color(0xff667085),
        ),
        border: OutlineInputBorder(
          borderSide: BorderSide(color: const Color(0xffD0D5DD), width: 0.5.spMin),
          borderRadius: BorderRadius.circular(8.r),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: const Color(0xffD0D5DD), width: 0.5.spMin),
          borderRadius: BorderRadius.circular(8.r),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: const Color(0xffD0D5DD), width: 0.5.spMin),
          borderRadius: BorderRadius.circular(8.r),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.r),
          borderSide: BorderSide(color: const Color(0xffFDA29B), width: 0.5.spMin),
        ),
      ),
    );
  }
}