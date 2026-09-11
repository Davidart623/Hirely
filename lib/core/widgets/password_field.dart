import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../app/theme/app_colors.dart';

class PasswordField extends StatefulWidget {
  const PasswordField({
    super.key,
    required this.controller,
    this.onChanged,
    this.validator,
    this.label = 'Password',
  });

  final TextEditingController controller;
  final Function(String)? onChanged;
  final String? Function(String?)? validator;
  final String label;

  @override
  State<PasswordField> createState() => _PasswordFieldState();
}

class _PasswordFieldState extends State<PasswordField> {
  bool _obscureText = true;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(

          widget.label,
          style: TextStyle(
              color: Color(0xff344054),
              fontSize: 14,
              fontWeight: FontWeight.w500),
        ),
        SizedBox(height: 6),
        TextFormField(
          controller: widget.controller,
          keyboardType: TextInputType.visiblePassword,
          obscureText: _obscureText,
          onChanged: widget.onChanged,
          validator: widget.validator,
          obscuringCharacter: "*",
          cursorErrorColor: AppColors.secondaryT,
          style: TextStyle(
            fontWeight: FontWeight.w400,
            color: AppColors.secondaryT,
            fontSize: 14.spMin,
          ),
          decoration: InputDecoration(
            contentPadding: EdgeInsets.symmetric(
              horizontal: 14.h,
              vertical: 10.spMin,
            ),
            suffixIcon: IconButton(
              onPressed: () {
                setState(() {
                  _obscureText = !_obscureText;
                });
              },

              icon: Icon(
                _obscureText
                    ? Icons.visibility_off_outlined
                    : Icons.visibility_outlined,
                color: Color(0xffD0D5DD),
              ),
            ),
            border: OutlineInputBorder(
              borderSide: BorderSide(color: Color(0xffD0D5DD), width: 0.5.w),
              borderRadius: BorderRadius.circular(8.r),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Color(0xffD0D5DD), width: 0.5.w),
              borderRadius: BorderRadius.circular(8.r),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8.r),
              borderSide: BorderSide(color: Color(0xffD0D5DD), width: 0.5.w),
            ),
          ),
        ),
      ],
    );
  }
}