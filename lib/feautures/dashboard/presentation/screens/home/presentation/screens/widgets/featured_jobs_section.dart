import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../../../../core/job_model.dart';
import 'featured_job_card.dart';
import 'page_dot_indicator.dart';

class FeaturedJobsSection extends StatefulWidget {
  final List<Job> jobs;
  final void Function(Job job) onJobTap;

  const FeaturedJobsSection({super.key, required this.jobs, required this.onJobTap});

  @override
  State<FeaturedJobsSection> createState() => _FeaturedJobsSectionState();
}

class _FeaturedJobsSectionState extends State<FeaturedJobsSection> {
  final PageController _controller = PageController();
  int _currentPage = 0;

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 180.h,
          child: PageView.builder(
            controller: _controller,
            itemCount: widget.jobs.length,
            onPageChanged: (index) => setState(() => _currentPage = index),
            itemBuilder: (context, index) {
              final job = widget.jobs[index];
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 4.0),
                child: FeaturedJobCard(
                  companyName: job.companyName,
                  jobTitle: job.jobTitle,
                  location: job.location,
                  salary: job.salary,
                  icon: job.icon,
                  logoAsset: job.logoAsset,
                  iconColor: job.iconColor,
                  tags: job.tags,
                  onTap: () => widget.onJobTap(job),
                ),
              );
            },
          ),
        ),
        SizedBox(height: 12.h),
        PageDotIndicator(itemCount: widget.jobs.length, currentIndex: _currentPage),
      ],
    );
  }
}