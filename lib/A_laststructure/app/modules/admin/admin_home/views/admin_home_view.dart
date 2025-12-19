import 'package:baca_app/A_laststructure/app/core/color/app_color.dart';
import 'package:baca_app/A_laststructure/app/core/constant/asset_constant.dart';
import 'package:baca_app/A_laststructure/app/core/font/app_text_style.dart';
import 'package:baca_app/A_laststructure/app/core/widget/admin_bottom_nav.dart';
import 'package:baca_app/A_laststructure/app/modules/admin/admin_home/controllers/top_stats_controller.dart';
import 'package:baca_app/A_laststructure/app/modules/admin/admin_home/widget/admin_notification_card.dart';
import 'package:baca_app/A_laststructure/app/modules/admin/admin_home/widget/quick_actions.dart';
import 'package:baca_app/A_laststructure/app/modules/admin/admin_home/widget/top_stats_card.dart';
import 'package:baca_app/A_laststructure/app/modules/notification/controllers/notification_controller.dart';
import 'package:baca_app/A_laststructure/app/routes/app_pages.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';

import '../controllers/admin_home_controller.dart';

class AdminHomeView extends GetView<AdminHomeController> {
  const AdminHomeView({super.key});
  @override
  Widget build(BuildContext context) {
    final notifC = Get.find<NotificationController>();
    final topStatsC = Get.find<TopStatsController>();
    return Scaffold(
      
      backgroundColor: AppColor.Neutral100,
      appBar: AppBar(
        scrolledUnderElevation: 0,
        backgroundColor: AppColor.Neutral100,
        actionsPadding: EdgeInsets.only(right: 16.w),
        leading: Row(
          children: [
            SizedBox(width: 16.w),
            Container(
              width: 26.w,
              height: 26.w,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(Assets.Assets_logo),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ],
        ),
        actions: [
          GestureDetector(
            onTap: () => Get.toNamed(Routes.NOTIFICATION),
            child: Container(
              width: 20.w,
              height: 20.w,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(Assets.Assets_appbar_notification),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
        ],
      ),
      body: ListView(
        children: [
          SizedBox(height: 12.h),
          Container(
            width: double.infinity,
            height: 160.h,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(Assets.Assets_home_ilustration),
                fit: BoxFit.cover,
              ),
            ),
          ),
          SizedBox(height: 32.h),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 16.w),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Quick Action",
                      style: AppTextStyle.body1(
                        color: AppColor.Neutral900,
                        fontWeight: AppTextStyle.bold,
                      ),
                    ),
                    Text(
                      "See All",
                      style: AppTextStyle.body3(
                        color: AppColor.Neutral400,
                        fontWeight: AppTextStyle.bold,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 16.h),
                QuickActions(),
              ],
            ),
          ),
          SizedBox(height: 32.h),
          Divider(color: AppColor.Neutral250, thickness: 8.h),
          SizedBox(height: 32.h),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 16.w),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Top Stats",
                      style: AppTextStyle.body1(
                        color: AppColor.Neutral900,
                        fontWeight: AppTextStyle.bold,
                      ),
                    ),
                    Text(
                      "See All",
                      style: AppTextStyle.body3(
                        color: AppColor.Neutral400,
                        fontWeight: AppTextStyle.bold,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 16.h),
                Obx(
                  () => GridView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: topStatsC.stats.length,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 16.w,
                      mainAxisSpacing: 16.h,
                      childAspectRatio: 3 / 2,
                    ),
                    itemBuilder: (context, index) {
                      final item = topStatsC.stats[index];
                      return TopStatsCard(
                        title: item['title'],
                        value: item['value'].toString(),
                        color: item['color'],
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 32.h),
          Divider(color: AppColor.Neutral250, thickness: 8.h),
          SizedBox(height: 32.h),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 16.w),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Recent Activity Logs",
                      style: AppTextStyle.body1(
                        color: AppColor.Neutral900,
                        fontWeight: AppTextStyle.bold,
                      ),
                    ),
                    Text(
                      "See All",
                      style: AppTextStyle.body3(
                        color: AppColor.Neutral400,
                        fontWeight: AppTextStyle.bold,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 16.h),
                notifC.obx(
                  (state) {
                    if (state == null) return Container();

                    final notifications = state.take(2).toList();
                    return ListView.builder(
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      itemCount: notifications.length,
                      itemBuilder: (context, index) {
                        final notification = notifications[index];
                        return AdminNotificationCard(
                          notification: notification,
                        );
                      },
                    );
                  },
                  onEmpty: Center(child: Text('No notifications')),
                  onLoading: Center(
                    child: CircularProgressIndicator(
                      color: AppColor.Primary500,
                    ),
                  ),
                  onError: (error) => Center(child: Text(error.toString())),
                ),
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: AdminCustomBottomNav(initialIndex: 0),
    );
  }
}
