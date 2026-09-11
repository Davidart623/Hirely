import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hirely/core/widgets/d_text.dart';

import '../../../../app/theme/app_colors.dart';

class RichTextW extends StatelessWidget {
  const RichTextW({
    super.key,
    required this.leadingText,
    required this.actionText,
    required this.onActionTap,
    this.leadingColor = const Color(0xffBDBEC2),
    this.actionColor,
    this.fontSize,
    this.leadingWeight = FontWeight.w400,
    this.actionWeight = FontWeight.w500,
  });

  final String leadingText;
  final String actionText;
  final VoidCallback onActionTap;
  final Color leadingColor;
  final Color? actionColor;
  final double? fontSize;
  final FontWeight leadingWeight;
  final FontWeight actionWeight;

  @override
  Widget build(BuildContext context) {
    final size = fontSize ?? 14.spMin;


    return RichText(
      text: TextSpan(
        children: [
          WidgetSpan(
            child: DText(
              inputText: leadingText,
              size: size,
              textColor: leadingColor,
              weight: leadingWeight,
            ),
          ),
          WidgetSpan(
            child: GestureDetector(
              onTap: onActionTap,
              child: DText(
                inputText: actionText,
                size: size,
                textColor: actionColor ?? AppColors.primary,
                weight: actionWeight,
              ),
            ),
          ),
        ],
      ),
    );
  }
}