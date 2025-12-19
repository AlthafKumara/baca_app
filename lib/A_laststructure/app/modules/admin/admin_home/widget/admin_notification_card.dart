import 'dart:math';

import 'package:baca_app/A_laststructure/app/core/color/app_color.dart';
import 'package:baca_app/A_laststructure/app/core/constant/asset_constant.dart';
import 'package:baca_app/A_laststructure/app/core/font/app_text_style.dart';
import 'package:baca_app/A_laststructure/app/core/utils/date_formatter.dart';
import 'package:baca_app/A_laststructure/app/data/model/notification_model.dart';
import 'package:baca_app/A_laststructure/app/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class AdminNotificationCard extends StatelessWidget {
  final NotificationModel notification;
  final void Function()? onTap;
  const AdminNotificationCard({
    super.key,
    required this.notification,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final dateCreate = DateFormatter.yearMonthDayFormatter(
      datetime: notification.createdAt,
    );

    final timeCreate = DateFormatter.timeFormatter(
      datetime: notification.createdAt,
    );

    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
        decoration: BoxDecoration(
          border: Border(
            bottom: BorderSide(color: AppColor.Neutral300, width: 1.w),
          ),
          color: notification.type == NotificationType.borrow_status
              ? AppColor.Neutral300
              : AppColor.Neutral100,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Stack(
              children: [
                Container(
                  width: 40.w,
                  height: 40.w,
                  decoration: BoxDecoration(
                    color: AppColor.Neutral100,
                    borderRadius: BorderRadius.circular(8.r),
                  ),
                  padding: EdgeInsets.all(8.w),
                  child: notification.type == NotificationType.general
                      ? Image.asset(Assets.Assets_logo)
                      : Image.asset(Assets.Assets_Notification_broadcast),
                ),
                if (notification.isRead == false)
                  Positioned(
                    bottom: 0,
                    right: 0,
                    child: Icon(
                      Icons.circle,
                      color: AppColor.Danger500,
                      size: 8.w,
                    ),
                  ),
              ],
            ),
            SizedBox(width: 12.w),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    notification.title,
                    style: AppTextStyle.body2(
                      color: AppColor.Neutral900,
                      fontWeight: AppTextStyle.semiBold,
                    ),
                  ),
                  SizedBox(height: 6.h),
                  Text(
                    notification.message,
                    style: AppTextStyle.description3(
                      color: AppColor.Neutral500,
                      fontWeight: AppTextStyle.regular,
                    ),
                  ),
                  SizedBox(height: 12.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        dateCreate,
                        style: AppTextStyle.description3(
                          color: AppColor.Neutral500,
                          fontWeight: AppTextStyle.regular,
                        ),
                      ),
                      Text(
                        timeCreate,
                        style: AppTextStyle.description3(
                          color: AppColor.Neutral500,
                          fontWeight: AppTextStyle.regular,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
