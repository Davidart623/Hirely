import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../../../../core/widgets/d_text.dart';


class HomeSearchBar extends StatelessWidget {
  final String hintText;
  final VoidCallback? onFilterTap;
  final VoidCallback? onSearchTap;

  const HomeSearchBar({
    super.key,
    this.hintText = 'Search a job or position',
    this.onFilterTap,
    this.onSearchTap,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: GestureDetector(
            onTap: onSearchTap,
            child: Container(
              height: 50.h,
              decoration: BoxDecoration(
                color: Colors.grey[200],
                borderRadius: BorderRadius.circular(16.r),
              ),
              child: Row(
                children: [
                  SizedBox(width: 16.w),

                  Icon(Icons.search, color: Colors.grey[500]),
                  SizedBox(width: 12.w),
                  DText(
                    inputText: hintText,
                    textAlign: TextAlign.left,
                    size: 14.spMin,
                    weight: FontWeight.normal,
                    textColor: Colors.grey[500],
                  ),
                ],
              ),
            ),
          ),
        ),
        SizedBox(width: 16.w),
        GestureDetector(
          onTap: onFilterTap,
          child: Container(
            height: 50.h,
            width: 50.w,
            decoration: BoxDecoration(
              color: Colors.grey[200],
              borderRadius: BorderRadius.circular(16.r),
            ),
            child: Center(
              child: Icon(Icons.tune, color: Colors.grey[700]),
            ),
          ),
        ),
      ],
    );
  }

}