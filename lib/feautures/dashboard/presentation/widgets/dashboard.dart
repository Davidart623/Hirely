import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../app/theme/app_colors.dart';

class NavItemData {
  final String iconPath;
  final String activeIconPath;

  const NavItemData({
    required this.iconPath,
    required this.activeIconPath,
  });
}

const List<NavItemData> navItems = [
  NavItemData(
    iconPath: 'assets/icons/home.3 1.svg',
    activeIconPath: 'assets/icons/Vector.svg',
  ),
  NavItemData(
    iconPath: 'assets/icons/message.6 1.svg',
    activeIconPath: 'assets/icons/message.6 1 (filled).svg',
  ),
  NavItemData(
    iconPath: 'assets/icons/category.1 1.svg',
    activeIconPath: 'assets/icons/category.1 1 (filled).svg',
  ),
];

class BottomNavBar extends StatelessWidget {

  final int currentIndex;
  final ValueChanged<int> onTap;

  const BottomNavBar({
    super.key,
    required this.currentIndex,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 14.h),
      decoration: BoxDecoration(
        color: AppColors.powermode2,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(24.r),
          topRight: Radius.circular(24.r),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: List.generate(navItems.length, (index) {
          final item = navItems[index];

          return _NavBarItem(
            data: item,
            isActive: index == currentIndex,
            onTap: () => onTap(index),
          );
        }),

      ),
    );
  }
}

class _NavBarItem extends StatelessWidget {
  final NavItemData data;
  final bool isActive;
  final VoidCallback onTap;

  const _NavBarItem({
    required this.data,
    required this.isActive,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      behavior: HitTestBehavior.opaque,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          SvgPicture.asset(
            isActive ? data.activeIconPath : data.iconPath,
            width: 24.w,
            height: 24.w,
            colorFilter: isActive
                ? const ColorFilter.mode(AppColors.primary, BlendMode.srcIn)
                : null,
          ),

          SizedBox(height: 6.h),
          Container(
            width: 4.w,
            height: 4.w,
            decoration: BoxDecoration(
              color: isActive ? AppColors.primary : Colors.transparent,
              shape: BoxShape.circle,
            ),
          ),
        ],
      ),
    );
  }
}