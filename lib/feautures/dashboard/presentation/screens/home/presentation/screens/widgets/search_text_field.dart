import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../../../../app/theme/app_colors.dart';

class SearchTextField extends StatefulWidget {
  const SearchTextField({
    super.key,
    required this.search,
    this.hintText = 'Search a job or opportunity',
  });

  final TextEditingController search;
  final String hintText;

  @override
  State<SearchTextField> createState() => _SearchTextFieldState();
}

class _SearchTextFieldState extends State<SearchTextField> {
  @override
  void initState() {
    super.initState();
    widget.search.addListener(_onTextChanged);
  }

  void _onTextChanged() => setState(() {});

  @override
  void dispose() {
    widget.search.removeListener(_onTextChanged);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 354.w,
      height: 40.h,
      padding: EdgeInsets.symmetric(vertical: 6.h, horizontal: 8.5.w),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(14.r),
        border: Border.all(color: AppColors.searchtextField, width: 1),
      ),
      child: Row(
        children: [
          Icon(Icons.search, size: 22.sp, color: AppColors.searchtext),
          SizedBox(width: 10.w),
          Expanded(
            child: TextField(
              cursorColor: AppColors.secondaryT,
              controller: widget.search,
              style: TextStyle(fontSize: 14.sp),
              decoration: InputDecoration(
                isCollapsed: true,
                border: InputBorder.none,
                hintText: widget.hintText,
                hintStyle: TextStyle(
                  color: AppColors.searchtext,
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w400,
                  fontFamily: "Montserrat",
                ),
              ),
            ),
          ),
          if (widget.search.text.isNotEmpty)
            GestureDetector(
              onTap: () => widget.search.clear(),
              child: Icon(Icons.close, size: 18.sp, color: AppColors.searchtext),
            ),
        ],
      ),
    );
  }
}