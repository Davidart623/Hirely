import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../../../../core/widgets/d_text.dart';


class JobTagChip extends StatelessWidget {
  final String label;
  final Color backgroundColor;
  final Color textColor;

  const JobTagChip({
    super.key,
    required this.label,
    this.backgroundColor = Colors.white24,
    this.textColor = Colors.white,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(right: 8.w),
      padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 6.h),
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(20.r),
      ),
      child: DText(
        inputText: label,
        textAlign: TextAlign.left,
        size: 12.spMin,
        weight: FontWeight.normal,
        textColor: textColor,
      ),
    );
  }
}