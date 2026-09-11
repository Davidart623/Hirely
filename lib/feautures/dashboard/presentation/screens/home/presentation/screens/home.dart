import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hirely/feautures/dashboard/presentation/screens/home/presentation/screens/widgets/search_text_field.dart';
import '../../../../../../../app/app_route.dart';
import '../../../../../../../app/theme/app_colors.dart';
import '../../../../../../../core/job_data.dart';
import '../../../../../../../core/job_model.dart';
import 'widgets/featured_jobs_section.dart';
import 'widgets/home_header.dart';
import 'widgets/popular_jobs_section.dart';
import 'widgets/search_results_view.dart';
import 'widgets/section_header.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final TextEditingController searchController = TextEditingController();
  String _searchQuery = '';

  List<Job> get _filteredJobs {
    final query = _searchQuery.trim().toLowerCase();
    if (query.isEmpty) return [];
    return JobData.allJobs.where((job) {
      return job.jobTitle.toLowerCase().contains(query) ||
          job.companyName.toLowerCase().contains(query);
    }).toList();

  }

  bool get _isSearching => _searchQuery.trim().isNotEmpty;

  void _openJobDetails(Job job) {
    Navigator.pushNamed(context, AppRoute.jobDetails, arguments: job);
  }

  @override
  void initState() {
    super.initState();
    searchController.addListener(() {
      setState(() => _searchQuery = searchController.text);
    });
  }

  @override
  void dispose() {
    searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: 24.0.w, vertical: 16.0.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              SizedBox(height: 28.h),
              HomeHeader(greetingName: 'David Ayoola 👋'),
              SizedBox(height: 32.h),
              SearchTextField(search: searchController),
              SizedBox(height: 32.h),
              if (_isSearching)
                SearchResultsView(
                  results: _filteredJobs,
                  query: searchController.text,
                  onJobTap: _openJobDetails,
                )
              else ...[
                SectionHeader(title: 'Featured Jobs'),
                SizedBox(height: 16.h),
                FeaturedJobsSection(jobs: JobData.featuredJobs, onJobTap: _openJobDetails),
                SizedBox(height: 32.h),
                SectionHeader(title: 'Popular Jobs'),
                SizedBox(height: 16.h),
                PopularJobsSection(jobs: JobData.popularJobs, onJobTap: _openJobDetails),
              ],
            ],
          ),
        ),
      ),
    );
  }
}