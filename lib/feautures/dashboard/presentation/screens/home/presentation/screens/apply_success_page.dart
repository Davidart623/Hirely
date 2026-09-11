import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hirely/feautures/dashboard/dashboard_screen.dart';

import '../../../../../../../app/app_route.dart';
import '../../../../../../../app/theme/app_colors.dart';
import '../../../../../../../core/job_model.dart';
import '../../../../../../../core/widgets/d_text.dart';


class ApplySuccessPage extends StatelessWidget {
  const ApplySuccessPage({super.key});

  @override
  Widget build(BuildContext context) {
    final job = ModalRoute.of(context)!.settings.arguments as Job;

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.w),
          child: Column(
            children: [
              const Spacer(flex: 2),
             SvgPicture.asset("assets/icons/Featured icon.svg"),
              SizedBox(height: 32.h),
              DText(
                inputText: 'Successful',

                textAlign: TextAlign.center,
                size: 22.spMin,
                weight: FontWeight.bold,
                textColor: Colors.black,
              ),
              SizedBox(height: 12.h),
              DText(
                inputText: "You've successfully applied to ${job.jobTitle} role.",
                textAlign: TextAlign.center,
                size: 14.spMin,
                weight: FontWeight.normal,
                textColor: Colors.grey[600],
              ),
              const Spacer(flex: 3),
              SizedBox(
                width: double.infinity,
                height: 50.h,
                child: ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.primary,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16.r),
                    ),
                  ),
                  child: DText(
                    inputText: 'Track',
                    textAlign: TextAlign.center,
                    size: 16.spMin,
                    weight: FontWeight.bold,

                    textColor: Colors.white,
                  ),
                ),
              ),
              SizedBox(height: 12.h),
              SizedBox(
                width: double.infinity,
                height: 50.h,
                child: OutlinedButton(
                  onPressed: () {
                      Navigator.of(context).popUntil((route) => route.isFirst);},
                  style: OutlinedButton.styleFrom(
                    side: BorderSide(color: AppColors.primary),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16.r),
                    ),
                  ),
                  child: DText(
                    inputText: 'Browse Jobs',
                    textAlign: TextAlign.center,
                    size: 16.spMin,
                    weight: FontWeight.bold,
                    textColor: AppColors.primary,
                  ),
                ),
              ),
              SizedBox(height: 24.h),
            ],
          ),
        ),
      ),

    );
  }
}