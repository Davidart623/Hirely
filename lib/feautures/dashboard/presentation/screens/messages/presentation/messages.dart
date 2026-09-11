import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hirely/feautures/dashboard/presentation/screens/messages/presentation/screens/widgets/message_tile.dart';

import '../../../../../../app/theme/app_colors.dart';
import '../../../../../../core/widgets/d_text.dart';
import '../../home/presentation/screens/widgets/search_text_field.dart';


class Messages extends StatefulWidget {
  const Messages({super.key});

  @override
  State<Messages> createState() => _MessagesState();
}

class _MessagesState extends State<Messages> {
  final TextEditingController searchController = TextEditingController();

  final List<Map<String, dynamic>> _companyMessages = [
    {
      'name': 'Google',
      'preview': 'Are you available for an intervi...',
      'time': '11:45 am',
      'unreadCount': 4,
      'avatarAsset': 'assets/images/Google.png',
    },
    {
      'name': 'HP',
      'preview': 'We are looking forward to takin....',
      'time': '11:45 am',
      'unreadCount': 1,
      'avatarAsset': 'assets/images/hp.png',

    },
    {
      'name': 'Spotify',
      'preview': 'Are you available for an interview..',
      'time': '11:45 am',
      'unreadCount': null,
      'avatarAsset': 'assets/images/spotify.png',
    },
  ];

  final List<Map<String, dynamic>> _individualMessages = [
    {
      'name': 'Erik John',
      'preview': 'We are looking for a web develo...',
      'time': '11:45 am',
      'unreadCount': 7,
      'avatarAsset': 'assets/images/Ellipse john.png',
    },
    {
      'name': 'Nicolas Pooran',
      'preview': 'I checked your portfolio. It looks ...',
      'time': '11:45 am',
      'unreadCount': 2,
      'avatarAsset': 'assets/images/Ellipse nico.png',
    },
    {
      'name': 'Jessica Jenith',
      'preview': 'Are you available for an interview',
      'time': '11:45 am',
      'unreadCount': null,
      'avatarAsset': 'assets/images/Ellipse jenit.png',
    },

    {
      'name': 'Rowling Kint',
      'preview': 'Are you available for an interview',
      'time': '11:45 am',
      'unreadCount': null,
      'avatarAsset': 'assets/images/Ellipse int.png',
    },
  ];

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
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 16.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 10.h,),
              _buildHeader(),
              SizedBox(height: 20.h),
              SearchTextField(
                search: searchController,
                hintText: 'Search a chat or message',
              ),
              SizedBox(height: 24.h),

              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _buildSectionLabel('Companies'),
                      ..._companyMessages.map((m) => MessageTile(
                        name: m['name'],
                        preview: m['preview'],
                        time: m['time'],
                        unreadCount: m['unreadCount'],
                        avatarAsset: m['avatarAsset'],
                        onTap: () {},
                      )),
                      SizedBox(height: 16.h),
                      _buildSectionLabel('Individual Messages'),
                      ..._individualMessages.map((m) => MessageTile(
                        name: m['name'],
                        preview: m['preview'],
                        time: m['time'],
                        unreadCount: m['unreadCount'],
                        avatarAsset: m['avatarAsset'],
                        onTap: () {},
                      )),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),

    );
  }

  Widget _buildHeader() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        DText(
          inputText: 'Messages',
          textAlign: TextAlign.left,
          size: 22.spMin,
          weight: FontWeight.bold,
          textColor: Colors.black,
        ),
        Row(
          children: [
            Icon(Icons.search, color: AppColors.primary),
            SizedBox(width: 16.w),
            Icon(Icons.edit_outlined, color: AppColors.primary),
          ],
        ),
      ],
    );
  }

  Widget _buildSectionLabel(String label) {
    return Padding(
      padding: EdgeInsets.only(bottom: 8.h),
      child: DText(
        inputText: label,
        textAlign: TextAlign.left,
        size: 15.spMin,

        weight: FontWeight.bold,
        textColor: Colors.black,
      ),
    );
  }
}