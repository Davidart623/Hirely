import 'package:flutter/material.dart';

class Job {
  final String companyName;
  final String jobTitle;
  final String location;
  final String salary;
  final String? logoUrl;
  final String? logoAsset;
  final IconData? icon;
  final Color iconColor;
  final List<String> tags;
  final String description;
  final List<String> responsibilities;
  final String? requirement;
  final String? about;
  final String? reviews;

  const Job({
    required this.companyName,
    required this.jobTitle,
    required this.location,
    required this.salary,
    this.logoUrl,
    this.logoAsset,
    this.icon,
    this.iconColor = Colors.black,
    this.tags = const [],
    this.description = '',
    this.responsibilities = const [],
    this.requirement,
    this.about,

    this.reviews,
  });
}