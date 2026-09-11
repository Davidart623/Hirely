import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../../../../core/widgets/d_text.dart';


class SectionHeader extends StatelessWidget {
  final String title;
  final String actionLabel;
  final VoidCallback? onActionTap;

  const SectionHeader({
    super.key,
    required this.title,
    this.actionLabel = 'See all',
    this.onActionTap,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        DText(
          inputText: title,
          textAlign: TextAlign.left,
          size: 18.spMin,
          weight: FontWeight.bold,
          textColor: Colors.black,
        ),
        GestureDetector(
          onTap: onActionTap,
          child: DText(
            inputText: actionLabel,

            textAlign: TextAlign.left,
            size: 14.spMin,
            weight: FontWeight.normal,
            textColor: Colors.grey[500],
          ),
        ),
      ],
    );
  }
}