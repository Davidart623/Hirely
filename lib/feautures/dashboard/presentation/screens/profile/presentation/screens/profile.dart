import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../../../app/app_route.dart';
import '../../../../../../../app/theme/app_colors.dart';
import '../../../../../../../core/widgets/d_text.dart';
import 'widgets/profile_menu_item.dart';

class Profile extends StatelessWidget {
  const Profile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: 16.h),
              _buildProfileHeader(),
              SizedBox(height: 24.h),
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ProfileMenuItem(
                        icon: Icons.info_outline,
                        label: 'Personal Info',
                        onTap: () {},

                      ),
                      ProfileMenuItem(
                        icon: Icons.assignment_outlined,
                        label: 'Applications',
                        onTap: () {},
                      ),
                      ProfileMenuItem(
                        icon: Icons.fact_check_outlined,
                        label: 'Proposals',
                        onTap: () {},
                      ),
                      ProfileMenuItem(
                        icon: Icons.badge_outlined,
                        label: 'Resumes',
                        onTap: () {},
                      ),
                      ProfileMenuItem(
                        icon: Icons.work_outline,
                        label: 'Portfolio',
                        onTap: () {},
                      ),
                      ProfileMenuItem(
                        icon: Icons.description_outlined,
                        label: 'Cover Letters',
                        onTap: () {},
                      ),
                      ProfileMenuItem(
                        icon: Icons.settings_outlined,
                        label: 'Settings',
                        onTap: () {},
                      ),
                      ProfileMenuItem(

                        icon: Icons.logout,
                        label: 'Logout',
                        color: Colors.red,
                        onTap: () {
                          Navigator.of(context, rootNavigator: true).pushNamedAndRemoveUntil(
                            AppRoute.login,
                                (route) => false,
                          );
                        },
                      ),
                    ],
                  ),
                ),
              ),
              _buildGoPremiumButton(),
              SizedBox(height: 24.h),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildProfileHeader() {
    return Column(
      children: [
        CircleAvatar(
          radius: 44.r,
          backgroundColor: AppColors.primary.withOpacity(0.1),
          backgroundImage:    AssetImage("assets/images/Ellipse.png"),
        ),
        SizedBox(height: 12.h),
        DText(
          inputText: 'David Ayoola',
          textAlign: TextAlign.center,
          size: 18.spMin,
          weight: FontWeight.bold,

          textColor: Colors.black,
        ),
        SizedBox(height: 4.h),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            DText(
              inputText: 'UX Designer',
              textAlign: TextAlign.center,
              size: 13.spMin,
              weight: FontWeight.normal,
              textColor: Colors.grey[600],
            ),
            SizedBox(width: 4.w),
            Icon(Icons.verified, size: 14, color: AppColors.primary),
          ],
        ),
        SizedBox(height: 6.h),
        GestureDetector(
          onTap: () {},
          child: DText(
            inputText: 'View Profile',
            textAlign: TextAlign.center,
            size: 13.spMin,
            weight: FontWeight.w600,
            textColor: AppColors.primary,
          ),
        ),
      ],
    );
  }

  Widget _buildGoPremiumButton() {
    return SizedBox(
      width: double.infinity,
      height: 50.h,
      child: ElevatedButton.icon(
        onPressed: () {},
        icon: Icon(Icons.workspace_premium, color: Colors.white, size: 18),
        label: DText(
          inputText: 'Go Premium',
          textAlign: TextAlign.center,
          size: 15.spMin,
          weight: FontWeight.bold,
          textColor: Colors.white,
        ),
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.primary,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16.r),
          ),
        ),
      ),
    );
  }
}