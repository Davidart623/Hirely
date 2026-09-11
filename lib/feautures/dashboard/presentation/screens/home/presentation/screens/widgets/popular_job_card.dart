import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../../../../../core/widgets/d_text.dart';

class PopularJobCard extends StatelessWidget {
  final String companyName;
  final String jobTitle;
  final String location;
  final String salary;
  final String? logoUrl;
  final String? logoAsset;
  final IconData? icon;
  final Color iconColor;
  final VoidCallback? onTap;

  const PopularJobCard({
    super.key,
    required this.companyName,
    required this.jobTitle,
    required this.location,
    required this.salary,
    this.logoUrl,
    this.logoAsset,
    this.icon,
    this.iconColor = Colors.black,
    this.onTap,
  });

  bool _isSvg(String path) => path.toLowerCase().endsWith('.svg');


  Widget _buildLogo() {
    if (logoAsset != null) {
      if (_isSvg(logoAsset!)) {
        return SvgPicture.asset(
          logoAsset!,
          width: 28.w,
          height: 28.w,
          fit: BoxFit.contain,
        );
      }
      return Image.asset(
        logoAsset!,
        width: 28.w,
        height: 28.w,
        fit: BoxFit.contain,
        errorBuilder: (context, error, stackTrace) {
          return Icon(icon ?? Icons.business, color: iconColor, size: 28);
        },
      );
    }
    if (logoUrl != null) {
      if (_isSvg(logoUrl!)) {
        return SvgPicture.network(
          logoUrl!,
          width: 28.w,
          height: 28.w,
          fit: BoxFit.contain,
        );
      }
      return Image.network(
        logoUrl!,
        width: 28.w,

        height: 28.w,
        fit: BoxFit.contain,
        loadingBuilder: (context, child, progress) {
          if (progress == null) return child;
          return SizedBox(
            width: 28.w,
            height: 28.w,
            child: const Center(child: CircularProgressIndicator(strokeWidth: 2)),
          );
        },
        errorBuilder: (context, error, stackTrace) {
          return Icon(icon ?? Icons.business, color: iconColor, size: 28);
        },
      );
    }
    return Icon(icon ?? Icons.business, color: iconColor, size: 28);
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.all(16.w),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20.r),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.02),
              blurRadius: 10,
              offset: const Offset(0, 4),

            ),
          ],
        ),
        child: Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(6.r),
              child: _buildLogo(),
            ),
            SizedBox(width: 16.w),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  DText(
                    inputText: jobTitle,
                    textAlign: TextAlign.left,
                    size: 16.spMin,
                    weight: FontWeight.bold,
                    textColor: Colors.black,
                  ),
                  SizedBox(height: 4.h),
                  DText(
                    inputText: companyName,
                    textAlign: TextAlign.left,
                    size: 14.spMin,
                    weight: FontWeight.normal,
                    textColor: Colors.grey[500],
                  ),
                ],
              ),
            ),

            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                DText(
                  inputText: salary,
                  textAlign: TextAlign.right,
                  size: 14.spMin,
                  weight: FontWeight.bold,
                  textColor: Colors.black,
                ),
                SizedBox(height: 4.h),
                DText(
                  inputText: location,
                  textAlign: TextAlign.right,
                  size: 12.spMin,
                  weight: FontWeight.normal,
                  textColor: Colors.grey[500],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}