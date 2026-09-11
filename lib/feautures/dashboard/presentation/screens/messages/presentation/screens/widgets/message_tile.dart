import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../../../../app/theme/app_colors.dart';
import '../../../../../../../../core/widgets/d_text.dart';

class MessageTile extends StatelessWidget {
  final String name;
  final String preview;
  final String time;
  final int? unreadCount;
  final String? avatarAsset;
  final bool isCircularAvatar;
  final VoidCallback? onTap;

  const MessageTile({
    super.key,
    required this.name,
    required this.preview,
    required this.time,
    this.unreadCount,
    this.avatarAsset,
    this.isCircularAvatar = true,
    this.onTap,
  });

  bool get _hasUnread => unreadCount != null && unreadCount! > 0;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 10.h),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CircleAvatar(
              radius: 22.r,
              backgroundColor: Colors.grey[200],
              backgroundImage: avatarAsset != null ? AssetImage(avatarAsset!) : null,
              child: avatarAsset == null
                  ? Icon(Icons.person, color: Colors.grey[500])
                  : null,
            ),
            SizedBox(width: 12.w),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  DText(
                    inputText: name,
                    textAlign: TextAlign.left,
                    size: 15.spMin,
                    weight: FontWeight.bold,
                    textColor: Colors.black,
                  ),
                  SizedBox(height: 2.h),
                  DText(
                    inputText: preview,
                    textAlign: TextAlign.left,
                    size: 13.spMin,
                    weight: FontWeight.normal,
                    textColor: Colors.grey[500],
                    maxLines: 1,
                  ),
                ],
              ),
            ),
            SizedBox(width: 8.w),
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                DText(
                  inputText: time,
                  textAlign: TextAlign.right,
                  size: 12.spMin,
                  weight: FontWeight.normal,
                  textColor: _hasUnread ? AppColors.primary : Colors.grey[400],
                ),
                SizedBox(height: 6.h),
                if (_hasUnread)
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 7.w, vertical: 2.h),
                    decoration:  BoxDecoration(
                      color: AppColors.primary,
                      shape: BoxShape.circle,
                    ),
                    child: DText(
                      inputText: '$unreadCount',
                      textAlign: TextAlign.center,
                      size: 11.spMin,
                      weight: FontWeight.bold,
                      textColor: Colors.white,
                    ),
                  ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}