import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../../../../../../../app/theme/app_colors.dart';
import '../../../../../../../../core/widgets/d_text.dart';
import 'job_tag_chip.dart';

class FeaturedJobCard extends StatelessWidget {
  final String companyName;
  final String jobTitle;
  final String location;
  final String salary;
  final String? logoUrl;
  final String? logoAsset;
  final IconData? icon;
  final Color iconColor;
  final List<String> tags;
  final VoidCallback? onBookmarkTap;
  final VoidCallback? onTap;

  const FeaturedJobCard({
    super.key,
    required this.companyName,
    required this.jobTitle,
    required this.location,
    required this.salary,
    this.logoUrl,
    this.logoAsset,
    this.icon,
    this.iconColor = Colors.black,
    required this.tags,
    this.onBookmarkTap,

    this.onTap,
  });

  bool _isSvg(String path) => path.toLowerCase().endsWith('.svg');

  Widget _buildLogo() {
    if (logoAsset != null) {
      if (_isSvg(logoAsset!)) {
        return SvgPicture.asset(
          logoAsset!,
          width: 24,
          height: 24,
          fit: BoxFit.contain,
        );
      }
      return Image.asset(
        logoAsset!,
        width: 24,
        height: 24,
        fit: BoxFit.contain,
        errorBuilder: (context, error, stackTrace) {
          return Icon(icon ?? Icons.business, color: iconColor, size: 24);
        },
      );
    }

    if (logoUrl != null) {
      if (_isSvg(logoUrl!)) {
        return SvgPicture.network(
          logoUrl!,
          width: 24,
          height: 24,

          fit: BoxFit.contain,
        );
      }
      return Image.network(
        logoUrl!,
        width: 24,
        height: 24,
        fit: BoxFit.contain,
        loadingBuilder: (context, child, progress) {
          if (progress == null) return child;
          return const SizedBox(
            width: 24,
            height: 24,
            child: Center(child: CircularProgressIndicator(strokeWidth: 2)),
          );
        },
        errorBuilder: (context, error, stackTrace) {
          return Icon(icon ?? Icons.business, color: iconColor, size: 24);
        },
      );
    }

    return Icon(icon ?? Icons.business, color: iconColor, size: 24);
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: double.infinity,
        padding: EdgeInsets.all(20.w),

        decoration: BoxDecoration(
          color: AppColors.primary,
          borderRadius: BorderRadius.circular(24.r),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Container(
                  padding: EdgeInsets.all(8.w),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12.r),
                  ),
                  child: _buildLogo(),
                ),
                SizedBox(width: 12.w),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      DText(
                        inputText: jobTitle,
                        textAlign: TextAlign.left,
                        size: 16.spMin,
                        weight: FontWeight.bold,
                        textColor: Colors.white,
                      ),
                      DText(
                        inputText: companyName,
                        textAlign: TextAlign.left,

                        size: 14.spMin,
                        weight: FontWeight.normal,
                        textColor: Colors.white.withOpacity(0.8),
                      ),
                    ],
                  ),
                ),
                GestureDetector(
                  onTap: onBookmarkTap,
                  child: Icon(Icons.bookmark_border, color: Colors.white.withOpacity(0.8)),
                ),
              ],
            ),
            SizedBox(height: 20.h),
            Row(
              children: tags.map((tag) => JobTagChip(label: tag)).toList(),
            ),
            const Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                DText(
                  inputText: salary,
                  textAlign: TextAlign.left,
                  size: 14.spMin,
                  weight: FontWeight.bold,
                  textColor: Colors.white,
                ),
                DText(
                  inputText: location,
                  textAlign: TextAlign.left,
                  size: 12.spMin,

                  weight: FontWeight.normal,
                  textColor: Colors.white.withOpacity(0.8),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}