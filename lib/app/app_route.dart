import 'package:flutter/material.dart';

import '../feautures/auth/presentation/screens/login.dart';
import '../feautures/auth/presentation/screens/sign_up.dart';
import '../feautures/dashboard/dashboard_screen.dart';
import '../feautures/dashboard/presentation/screens/home/presentation/screens/job_details.dart';
import '../feautures/dashboard/presentation/screens/home/presentation/screens/apply_success_page.dart';
import '../feautures/splash_screen.dart';
class AppRoute {
  static const String splash = '/';
  static const String login = '/login';
  static const String signUp = '/signup';
  static const String dashboardScreen = 'dashboardScreen';
  static const String jobDetails = '/jobDetails';
  static const String applySuccess = '/applySuccess';

  static final routes = <String, Widget Function(BuildContext)>{
    splash: (context) => const SplashScreen(),
    login: (context) => const Login(),
    signUp: (context) => const SignUp(),
    dashboardScreen: (context) => const DashboardScreen(),
    jobDetails: (context) => const JobDetailsPage(),
    applySuccess: (context) => const ApplySuccessPage(),
  };
}