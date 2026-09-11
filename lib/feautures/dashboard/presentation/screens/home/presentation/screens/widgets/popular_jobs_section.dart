import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../../../../core/job_model.dart';
import 'popular_job_card.dart';

class PopularJobsSection extends StatelessWidget {
  final List<Job> jobs;
  final void Function(Job job) onJobTap;

  const PopularJobsSection({super.key, required this.jobs, required this.onJobTap});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: jobs
          .map((job) => Padding(
        padding: EdgeInsets.only(bottom: 16.h),
        child: PopularJobCard(
          companyName: job.companyName,
          jobTitle: job.jobTitle,
          location: job.location,
          salary: job.salary,
          logoAsset: job.logoAsset,
          icon: job.icon,
          iconColor: job.iconColor,
          onTap: () => onJobTap(job),
        ),
      ))
          .toList(),
    );
  }
}