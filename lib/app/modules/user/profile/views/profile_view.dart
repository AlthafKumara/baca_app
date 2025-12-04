import 'package:baca_app/app/core/color/app_color.dart';
import 'package:baca_app/app/core/font/app_text_style.dart';
import 'package:baca_app/app/core/widget/bottom_nav.dart';
import 'package:baca_app/app/modules/user/home/controllers/bottomnav_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';

import '../controllers/profile_controller.dart';

class ProfileView extends StatelessWidget {
  ProfileView({super.key});
  @override
  Widget build(BuildContext context) {
    final controller = Get.find<ProfileController>();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColor.Neutral100,
        title: Text(
          'Library',
          style: AppTextStyle.heading3(
            fontWeight: AppTextStyle.bold,
            color: AppColor.Neutral900,
          ),
        ),
      ),
      body: Obx(() {
        final user = controller.profile.value;
        final photo = user?.photoProfile;

        return Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 20.h),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 48.w,
                    width: 48.w,
                    child: CircleAvatar(
                      backgroundImage: photo != null
                          ? NetworkImage(photo)
                          : null,
                      child: photo == null
                          ? Icon(
                              Icons.person,
                              size: 40.sp,
                              color: AppColor.Neutral100,
                            )
                          : null,
                    ),
                  ),
                ],
              ),
            ],
          ),
        );
      }),
      bottomNavigationBar: CustomBottomNav(initialindex: 3),
    );
  }
}
