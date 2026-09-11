import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../../../../app/app_route.dart';
import '../../../../../../../app/theme/app_colors.dart';
import '../../../../../../../core/job_model.dart';
import '../../../../../../../core/widgets/d_text.dart';

import 'widgets/job_tag_chip.dart';

class JobDetailsPage extends StatelessWidget {
  const JobDetailsPage({super.key});

  bool _isSvg(String path) => path.toLowerCase().endsWith('.svg');

  Widget _buildLogo(Job job) {
    if (job.logoAsset != null) {
      if (_isSvg(job.logoAsset!)) {
        return SvgPicture.asset(job.logoAsset!, width: 60, height: 60, fit: BoxFit.contain);
      }
      return Image.asset(
        job.logoAsset!,
        width: 60,
        height: 60,
        fit: BoxFit.contain,
        errorBuilder: (context, error, stackTrace) {
          return Icon(job.icon ?? Icons.business, color: job.iconColor, size: 40);
        },
      );
    }
    if (job.logoUrl != null) {
      if (_isSvg(job.logoUrl!)) {
        return SvgPicture.network(job.logoUrl!, width: 60, height: 60, fit: BoxFit.contain);
      }
      return Image.network(
        job.logoUrl!,
        width: 60,
        height: 60,
        fit: BoxFit.contain,
        errorBuilder: (context, error, stackTrace) {
          return Icon(job.icon ?? Icons.business, color: job.iconColor, size: 40);
        },
      );
    }
    return Icon(job.icon ?? Icons.business, color: job.iconColor, size: 40);
  }

  @override
  Widget build(BuildContext context) {
    final job = ModalRoute.of(context)!.settings.arguments as Job;

    return DefaultTabController(
      length: 4,
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 12.h),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                      onTap: () => Navigator.pop(context),
                      child: const Icon(Icons.arrow_back_ios_new),
                    ),
                    GestureDetector(
                      onTap: () {},
                      child: const Icon(Icons.bookmark_border),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: SingleChildScrollView(
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 24.w),
                    child: Column(
                      children: [
                        CircleAvatar(
                          radius: 40.r,
                          backgroundColor: Colors.grey[100],
                          child: _buildLogo(job),
                        ),
                        SizedBox(height: 16.h),
                        DText(
                          inputText: job.jobTitle,
                          textAlign: TextAlign.center,
                          size: 20.spMin,
                          weight: FontWeight.bold,
                          textColor: Colors.black,
                        ),
                        SizedBox(height: 4.h),
                        DText(
                          inputText: job.companyName,
                          textAlign: TextAlign.center,
                          size: 14.spMin,
                          weight: FontWeight.normal,
                          textColor: Colors.grey[500],
                        ),
                        SizedBox(height: 16.h),
                        Wrap(
                          alignment: WrapAlignment.center,
                          children: job.tags
                              .map((tag) => JobTagChip(
                            label: tag,
                            backgroundColor: Colors.grey[200]!,
                            textColor: Colors.black87,
                          ))
                              .toList(),
                        ),
                        SizedBox(height: 20.h),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            DText(
                              inputText: job.salary,
                              textAlign: TextAlign.left,
                              size: 16.spMin,
                              weight: FontWeight.bold,
                              textColor: Colors.black,
                            ),
                            DText(
                              inputText: job.location,
                              textAlign: TextAlign.right,
                              size: 14.spMin,
                              weight: FontWeight.w500,
                              textColor: AppColors.primary,
                            ),
                          ],
                        ),
                        SizedBox(height: 20.h),
                        TabBar(
                          labelColor: Colors.black,
                          unselectedLabelColor: Colors.grey,
                          indicatorColor: AppColors.primary,
                          tabs: const [
                            Tab(text: 'Description'),
                            Tab(text: 'Requirement'),
                            Tab(text: 'About'),
                            Tab(text: 'Reviews'),
                          ],
                        ),
                        SizedBox(
                          height: 300.h,
                          child: TabBarView(
                            children: [
                              _DescriptionTab(job: job),
                              _PlainTextTab(text: job.requirement ?? 'No requirements listed.'),
                              _PlainTextTab(text: job.about ?? 'No company info listed.'),
                              _PlainTextTab(text: job.reviews ?? 'No reviews yet.'),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(24.w),
                child: SizedBox(
                  width: double.infinity,
                  height: 50.h,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.pushNamed(
                        context,
                        AppRoute.applySuccess,
                        arguments: job,
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.primary,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16.r),
                      ),
                    ),
                    child: DText(
                      inputText: 'Apply Now',
                      textAlign: TextAlign.center,
                      size: 16.spMin,
                      weight: FontWeight.bold,
                      textColor: Colors.white,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _DescriptionTab extends StatelessWidget {
  final Job job;
  const _DescriptionTab({required this.job});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.symmetric(vertical: 16.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          DText(
            inputText: job.description.isEmpty ? 'No description provided.' : job.description,
            textAlign: TextAlign.left,
            size: 14.spMin,
            weight: FontWeight.normal,
            textColor: Colors.grey[700],
          ),
          if (job.responsibilities.isNotEmpty) ...[
            SizedBox(height: 20.h),
            DText(
              inputText: 'Responsibilities:',
              textAlign: TextAlign.left,
              size: 15.spMin,
              weight: FontWeight.bold,
              textColor: Colors.black,
            ),
            SizedBox(height: 8.h),
            ...job.responsibilities.map(
                  (item) => Padding(
                padding: EdgeInsets.only(bottom: 6.h),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    DText(
                      inputText: '•  ',
                      textAlign: TextAlign.left,
                      size: 14.spMin,
                      weight: FontWeight.normal,
                      textColor: Colors.grey[700],
                    ),
                    Expanded(
                      child: DText(
                        inputText: item,
                        textAlign: TextAlign.left,
                        size: 14.spMin,
                        weight: FontWeight.normal,
                        textColor: Colors.grey[700],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ],
      ),
    );
  }
}

class _PlainTextTab extends StatelessWidget {
  final String text;
  const _PlainTextTab({required this.text});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.symmetric(vertical: 16.h),
      child: DText(
        inputText: text,
        textAlign: TextAlign.left,
        size: 14.spMin,
        weight: FontWeight.normal,
        textColor: Colors.grey[700],
      ),
    );
  }
}