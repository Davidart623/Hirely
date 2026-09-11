import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../app/theme/app_colors.dart';

class Password extends StatefulWidget {
  const Password({
    super.key,
    required this.password,
    this.onChanged,
    this.validator,
    this.label = 'Password',
    this.showChecklist = true,
    this.onValidityChanged,
  });

  final TextEditingController password;
  final Function(String)? onChanged;
  final String? Function(String?)? validator;
  final String label;
  final bool showChecklist;
  final Function(bool)? onValidityChanged;

  @override
  State<Password> createState() => _PasswordState();
}

class _PasswordState extends State<Password> {
  bool _obscureText = true;
  bool _isMinLength = false;
  bool _hasUppercase = false;
  bool _hasLowercase = false;
  bool _hasDigit = false;
  bool _hasSpecial = false;

  void _validatePassword(String value) {
    setState(() {
      _isMinLength = value.length >= 8;
      _hasUppercase = RegExp(r'[A-Z]').hasMatch(value);
      _hasLowercase = RegExp(r'[a-z]').hasMatch(value);
      _hasDigit = RegExp(r'[0-9]').hasMatch(value);
      _hasSpecial = RegExp(r'[!@#\$&*~]').hasMatch(value);
    });
    if (widget.showChecklist) {
      final isValid = _isMinLength &&
          _hasUppercase &&
          _hasLowercase &&
          _hasDigit &&
          _hasSpecial;
      widget.onValidityChanged?.call(isValid);
    } else {
      widget.onValidityChanged?.call(value.isNotEmpty);
    }
  }

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
          cursorColor: AppColors.secondaryT,
          controller: widget.password,
          keyboardType: TextInputType.visiblePassword,
          obscureText: _obscureText,
          onChanged: _validatePassword,
          validator: widget.validator,
          obscuringCharacter: "*",
          cursorErrorColor: AppColors.secondaryT,
          style: TextStyle(
            fontWeight: FontWeight.w400,
            fontSize: 12.spMin,
            fontFamily: "Poppins",
            color: const Color(0xff667085),
          ),
          decoration: InputDecoration(
            contentPadding: EdgeInsets.symmetric(
              horizontal: 14.h,
              vertical: 10.spMin,
            ),
            hintText: "Enter your password",
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
        SizedBox(height: 12),
        if (widget.showChecklist)
          Wrap(
            spacing: 16.w,
            runSpacing: 10.h,
            children: [
              PasswordTile(title: '1 uppercase', isValid: _hasUppercase),
              PasswordTile(title: '1 lowercase', isValid: _hasLowercase),
              PasswordTile(title: '1 one number', isValid: _hasDigit),
              PasswordTile(
                  title: '8 characters minimum', isValid: _isMinLength),
              PasswordTile(
                  title: '1 special character', isValid: _hasSpecial),
            ],
          ),
      ],
    );
  }
}

class PasswordTile extends StatelessWidget {
  const PasswordTile({super.key, required this.title, required this.isValid});

  final String title;
  final bool isValid;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        SvgPicture.asset(
          isValid
              ? "assets/icons/Check icon (filled).svg"
              : 'assets/icons/Check icon.svg',
          height: 16.h,
          width: 16.w,
          fit: BoxFit.scaleDown,
        ),
        SizedBox(width: 6.w),
        Text(
          title,
          style: TextStyle(
            fontSize: 13.spMin,
            fontWeight: FontWeight.w400,
            color: Color(0xff475467),
          ),
        ),
      ],
    );
  }
}