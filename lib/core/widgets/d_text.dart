import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../app/theme/app_colors.dart';

class DText extends StatelessWidget {
  const DText({
    super.key, required this.inputText, this.family, this.size, this.weight, this.textColor, this.textAlign, this.textStyle, this.maxLines, this.overflow,
  });

  final String inputText;
  final String? family;
  final double? size;
  final FontWeight? weight;
  final Color? textColor;
  final TextAlign? textAlign;
  final TextStyle? textStyle;
  final int? maxLines;
  final TextOverflow? overflow;

  @override
  Widget build(BuildContext context) {
    return Text(
      inputText,
      textAlign: textAlign ?? TextAlign.center,
      maxLines: maxLines,
      overflow: overflow,
      style: textStyle ??

          TextStyle(
            fontSize: size ?? 15.spMin,
            fontWeight: weight ?? FontWeight.w700,
            color: textColor ?? AppColors.secondaryT,
            fontFamily: family ?? "Poppins",
          ),
    );
  }
}