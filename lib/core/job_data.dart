import 'package:flutter/material.dart';

import 'job_model.dart';

class JobData {
  static const List<Job> featuredJobs = [
    Job(
      companyName: 'Facebook',
      jobTitle: 'Software Engineer',
      location: 'California, USA',
      salary: '\$180,00/year',
      logoAsset: 'assets/icons/facebook.svg',
      icon: Icons.facebook,
      iconColor: Colors.blue,
      tags: ['IT', 'Full-Time', 'Junior'],
      description:
      "We are the teams who create all of Facebook's products used by billions of people around the world. Want to build new features and improve existing products like Messenger, Video, Groups, News Feed, Search and more?",
      responsibilities: [
        'Full stack web/mobile application development with a variety of coding languages',
        'Create consumer products and features using internal programming language Hack',
        'Implement web or mobile interfaces using XHTML, CSS, and JavaScript',
      ],
    ),
    Job(
      companyName: 'Google',
      jobTitle: 'Design Lead',
      location: 'California, USA',
      salary: '\$160,00/year',
      logoAsset: 'assets/icons/flat-color-icons_google.svg',
      icon: Icons.g_mobiledata,
      iconColor: Colors.red,
      tags: ['Design', 'Full-Time', 'Senior'],
      description:
      "Lead design direction across a suite of Google products, partnering closely with engineering and product to ship intuitive, accessible experiences at scale.",
      responsibilities: [
        'Define and drive design vision across multiple product teams',
        'Mentor junior designers and review design critiques',
        'Partner with research to validate design decisions',
      ],
    ),
    Job(
      companyName: 'Pinterest',
      jobTitle: 'Content Creator',
      location: 'Atlanta, USA',
      salary: '\$120,00/year',
      logoAsset: 'assets/images/pinterest.png',
      icon: Icons.g_mobiledata,
      iconColor: Colors.red,
      tags: ['Design', 'Full-Time', 'Junior'],
      description:
      "Support day-to-day execution across marketing and partnerships, working cross-functionally to help Pinterest grow its creator community.",
      responsibilities: [
        'Coordinate with cross-functional teams on campaign execution',
        'Track KPIs and report on partnership performance',
      ],
    ),
  ];

  static const List<Job> popularJobs = [
    Job(
      companyName: 'Burger King',
      jobTitle: 'Jr Executive',
      location: 'Los Angeles, US',
      salary: '\$96,000/y',
      icon: Icons.fastfood,
      logoAsset: 'assets/images/burger-king-4 1.png',
      iconColor: Colors.orange,
      description: 'Support restaurant operations and team coordination across LA locations.',
      responsibilities: [
        'Assist with daily operational planning',
        'Coordinate staff scheduling',
      ],
    ),
    Job(
      companyName: 'Beats',
      jobTitle: 'Product Manager',
      location: 'Florida, US',
      salary: '\$84,000/y',
      icon: Icons.headphones,
      logoAsset: 'assets/images/beats.png',
      iconColor: Colors.red,
      description: 'Own the roadmap for a key audio hardware product line from concept to launch.',
      responsibilities: [
        'Define product requirements and specs',
        'Work with engineering and design on execution',
      ],
    ),
    Job(
      companyName: 'Dribbble',
      jobTitle: 'UX Designer',
      location: 'Abeokuta Nigeria',
      salary: '\$20/h',
      icon: Icons.headphones,
      logoAsset: 'assets/images/logos_dribbble-icon.png',
      iconColor: Colors.red,
      description: 'Design intuitive interfaces for a global community of creatives.',
      responsibilities: [
        'Create wireframes and high-fidelity mockups',
        'Collaborate with engineers on implementation',
      ],
    ),
    Job(
      companyName: 'Spotify',
      jobTitle: 'Senior Dev',
      location: 'Florida, US',
      salary: '\$50/h',
      icon: Icons.headphones,
      logoAsset: 'assets/images/spotify.png',
      iconColor: Colors.red,
      description: 'Build and scale backend systems powering music streaming for millions of users.',
      responsibilities: [
        'Design and implement scalable backend services',
        'Mentor junior engineers',
      ],
    ),
  ];

  static List<Job> get allJobs => [...featuredJobs, ...popularJobs];
}