import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../app/theme/app_colors.dart';
import 'd_text.dart';



class AppButton extends StatelessWidget {
  const  AppButton({
    super.key,
    this.height,
    this.width,
    this.title,
    this.child,
    this.onPressed,
    this.isPrimary = true,
  });

  final double? height;
  final double? width;
  final String? title;
  final Widget? child;
  final VoidCallback? onPressed;
  final bool isPrimary;

  @override
  Widget build(BuildContext context) {
    final Color bgColor    = isPrimary ? AppColors.primary : Color(0x1A008751);
  final Color textColor  = isPrimary ? AppColors.backgroundColor : AppColors.primary;
    return InkWell(
      onTap: onPressed,
      borderRadius: BorderRadius.circular(12.r),
      child: Container(
        height: height ?? 44.h,
        width: width ?? 350.w,
        decoration: BoxDecoration(
          color: bgColor,
          borderRadius: BorderRadius.circular(8.r),
        ),
        child: Center(
              child: child ?? (
              DText(
               inputText: title ?? "Continue",
                textColor: AppColors.backgroundColor
              )
            ),
          ),
        ),
    );
  }
}