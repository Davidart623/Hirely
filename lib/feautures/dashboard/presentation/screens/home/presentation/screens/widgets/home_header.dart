import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../../../../core/widgets/d_text.dart';

class HomeHeader extends StatelessWidget {
  final String greetingName;

  const HomeHeader({super.key, required this.greetingName});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            DText(
              inputText: 'Welcome to Hirley!',
              textAlign: TextAlign.left,
              size: 14.spMin,
              weight: FontWeight.normal,
              textColor: Colors.grey[600],
            ),
            SizedBox(height: 4.h),
            DText(
              inputText: greetingName,
              textAlign: TextAlign.left,
              size: 24.spMin,
              weight: FontWeight.bold,
              textColor: Colors.black,
            ),

          ],
        ),
        Image.asset("assets/images/Ellipse.png"),
      ],
    );
  }
}