import 'package:baca_app/app/core/color/app_color.dart';
import 'package:baca_app/app/core/font/app_text_style.dart';
import 'package:baca_app/app/core/widget/admin_bottom_nav.dart';
import 'package:baca_app/app/modules/admin/admin_home/widget/quick_actions.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';

import '../controllers/admin_home_controller.dart';

class AdminHomeView extends GetView<AdminHomeController> {
  const AdminHomeView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.Neutral100,
      appBar: AppBar(
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
                  image: AssetImage("assets/Logo.png"),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ],
        ),
        actions: [
          Container(
            width: 20.w,
            height: 20.w,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/appbar/notification.png"),
                fit: BoxFit.cover,
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
                image: AssetImage("assets/home/ilustration.png"),
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
        ],
      ),
      bottomNavigationBar: AdminCustomBottomNav(initialIndex: 0),
    );
  }
}
