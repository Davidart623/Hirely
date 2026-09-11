import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../../../../app/theme/app_colors.dart';
class ProfileAvatarBadge extends StatelessWidget {
  final ImageProvider? backgroundImage;
  final bool showBadge;
  final Color badgeColor;

  const ProfileAvatarBadge({
    super.key,
    this.backgroundImage,
    this.showBadge = true,
    this.badgeColor = Colors.red,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        CircleAvatar(
          radius: 24.r,
          backgroundColor: Colors.grey,
          backgroundImage: backgroundImage,
          child: backgroundImage == null
              ? const Icon(Icons.person, color: Colors.white)
              : null,
        ),
        if (showBadge)
          Positioned(
            right: 0,
            top: 0,

            child: Container(
              width: 12.w,
              height: 12.w,
              decoration: BoxDecoration(
                color: badgeColor,
                shape: BoxShape.circle,
                border: Border.all(color: AppColors.backgroundColor, width: 2),
              ),
            ),
          ),
      ],
    );
  }
}