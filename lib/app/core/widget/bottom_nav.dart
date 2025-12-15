// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:baca_app/app/core/constant/asset_constant.dart';
import 'package:baca_app/app/modules/user/home/controllers/bottomnav_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:baca_app/app/core/color/app_color.dart';
import 'package:baca_app/app/core/font/app_text_style.dart';
import 'package:get/get.dart';

class CustomBottomNav extends StatelessWidget {
  final int initialindex;
  final controller = Get.put(BottomnavController());

  CustomBottomNav({Key? key, required this.initialindex}) : super(key: key) {
    controller.selectedIndex.value = initialindex;
  }

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: Theme.of(context).copyWith(
        splashColor: Colors.transparent,
        highlightColor: Colors.transparent,
      ),
      child: Obx(
        () => BottomNavigationBar(
          enableFeedback: false,
          type: BottomNavigationBarType.fixed,
          currentIndex: controller.selectedIndex.value,
          onTap: controller.changeIndex,
          backgroundColor: AppColor.Neutral100,
          elevation: 1,
          showSelectedLabels: true,
          showUnselectedLabels: true,
          selectedLabelStyle: AppTextStyle.body3(fontWeight: AppTextStyle.bold),
          unselectedLabelStyle: AppTextStyle.body3(
            fontWeight: AppTextStyle.medium,
          ),
          selectedItemColor: AppColor.Primary500,
          unselectedItemColor: AppColor.Neutral400,

          items: [
            BottomNavigationBarItem(
              icon: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(
                    width: 20.w,
                    height: 20.w,
                    child: Image.asset(Assets.Assets_bottomnav_book_inactive),
                  ),
                  SizedBox(height: 6.h),
                ],
              ),
              activeIcon: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(
                    width: 20.w,
                    height: 20.w,
                    child: Image.asset(Assets.Assets_bottomnav_book_active),
                  ),
                  SizedBox(height: 6.h),
                ],
              ),
              label: "Home",
            ),
            BottomNavigationBarItem(
              icon: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(
                    width: 20.w,
                    height: 20.w,
                    child: Image.asset("assets/bottomnav/feed_inactive.png"),
                  ),
                  SizedBox(height: 6.h),
                ],
              ),
              activeIcon: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(
                    width: 20.w,
                    height: 20.w,
                    child: Image.asset("assets/bottomnav/feed_active.png"),
                  ),
                  SizedBox(height: 6.h),
                ],
              ),
              label: "Feed",
            ),
            BottomNavigationBarItem(
              icon: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(
                    width: 20.w,
                    height: 20.w,
                    child: Image.asset("assets/bottomnav/library_inactive.png"),
                  ),
                  SizedBox(height: 6.h),
                ],
              ),
              activeIcon: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(
                    width: 20.w,
                    height: 20.w,
                    child: Image.asset(Assets.Assets_bottomnav_library_active),
                  ),
                  SizedBox(height: 6.h),
                ],
              ),
              label: "Library",
            ),
            BottomNavigationBarItem(
              icon: Column(
                children: [
                  SizedBox(
                    width: 20.w,
                    height: 20.w,
                    child: Image.asset(
                      Assets.Assets_bottomnav_profile_inactive,
                    ),
                  ),
                  SizedBox(height: 6.h),
                ],
              ),
              activeIcon: Column(
                children: [
                  SizedBox(
                    width: 20.w,
                    height: 20.w,
                    child: Image.asset(Assets.Assets_bottomnav_profile_active),
                  ),
                  SizedBox(height: 6.h),
                ],
              ),
              label: "Profile",
            ),
          ],
        ),
      ),
    );
  }
}
