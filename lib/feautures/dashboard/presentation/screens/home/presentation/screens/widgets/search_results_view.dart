import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../../../../core/job_model.dart';
import '../../../../../../../../core/widgets/d_text.dart';
import 'popular_job_card.dart';

class SearchResultsView extends StatelessWidget {
  final List<Job> results;
  final String query;
  final void Function(Job job) onJobTap;

  const SearchResultsView({
    super.key,
    required this.results,
    required this.query,
    required this.onJobTap,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        DText(
          inputText: '${results.length} result${results.length == 1 ? '' : 's'} for "$query"',
          textAlign: TextAlign.left,
          size: 14.spMin,
          weight: FontWeight.normal,
          textColor: Colors.grey[600],
        ),
        SizedBox(height: 16.h),
        if (results.isEmpty)

          Padding(
            padding: EdgeInsets.symmetric(vertical: 40.h),
            child: Center(
              child: DText(
                inputText: 'No jobs found. Try a different search.',
                textAlign: TextAlign.center,
                size: 14.spMin,
                weight: FontWeight.normal,
                textColor: Colors.grey[500],
              ),
            ),
          )
        else
          Column(
            children: results
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
          ),
      ],
    );

  }
}