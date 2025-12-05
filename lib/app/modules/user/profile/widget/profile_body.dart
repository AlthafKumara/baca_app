import 'package:baca_app/app/core/color/app_color.dart';
import 'package:baca_app/app/core/font/app_text_style.dart';

import 'package:baca_app/app/modules/user/profile/controllers/profile_controller.dart';
import 'package:baca_app/app/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class ProfileBody extends StatelessWidget {
  const ProfileBody({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<ProfileController>();
    return Obx(() {
      final profile = controller.profile.value;

      return Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 20.h),
        child: ListView(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(
                  width: 48.w,
                  height: 48.w,
                  child: CircleAvatar(
                    backgroundColor: AppColor.Neutral250,
                    foregroundColor: AppColor.Neutral400,
                    backgroundImage: profile?.photoProfile != null
                        ? NetworkImage(controller.profile.value!.photoProfile!)
                        : null,
                    child: profile?.photoProfile != null
                        ? null
                        : Icon(Icons.person),
                  ),
                ),
                SizedBox(width: 16.w),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      profile?.name ?? "",
                      style: AppTextStyle.body1(
                        fontWeight: AppTextStyle.medium,
                        color: AppColor.Neutral900,
                      ),
                    ),
                    SizedBox(height: 8.h),
                    Text(
                      profile?.role.name ?? "",
                      style: AppTextStyle.body3(
                        fontWeight: AppTextStyle.medium,
                        color: AppColor.Neutral400,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(height: 32.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  "Account",
                  style: AppTextStyle.body1(
                    fontWeight: AppTextStyle.semiBold,
                    color: AppColor.Neutral900,
                  ),
                ),
              ],
            ),
            SizedBox(height: 22.h),
            GestureDetector(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      SizedBox(
                        width: 16.w,
                        height: 16.w,
                        child: Image.asset("assets/profile/user.png"),
                      ),
                      SizedBox(width: 8.w),
                      Text(
                        "Personal Details",
                        style: AppTextStyle.body2(
                          fontWeight: AppTextStyle.medium,
                          color: AppColor.Neutral900,
                        ),
                      ),
                    ],
                  ),
                  Icon(Icons.arrow_forward_ios_rounded, size: 15.w),
                ],
              ),
            ),
            SizedBox(height: 18.w),
            Padding(
              padding: EdgeInsets.only(left: 32.w),
              child: Divider(height: 1.h, color: AppColor.Neutral300),
            ),
            SizedBox(height: 18.h),
            GestureDetector(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      SizedBox(
                        width: 16.w,
                        height: 16.w,
                        child: Image.asset("assets/profile/notification.png"),
                      ),
                      SizedBox(width: 8.w),
                      Text(
                        "Notification",
                        style: AppTextStyle.body2(
                          fontWeight: AppTextStyle.medium,
                          color: AppColor.Neutral900,
                        ),
                      ),
                    ],
                  ),
                  Icon(Icons.arrow_forward_ios_rounded, size: 15.w),
                ],
              ),
            ),
            SizedBox(height: 18.w),
            Padding(
              padding: EdgeInsets.only(left: 32.w),
              child: Divider(height: 1.h, color: AppColor.Neutral300),
            ),
            SizedBox(height: 18.h),
            GestureDetector(
              onTap: () {
                Get.toNamed(Routes.ACCOUNT_SETTING, arguments: profile);
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      SizedBox(
                        width: 16.w,
                        height: 16.w,
                        child: Image.asset("assets/profile/setting.png"),
                      ),
                      SizedBox(width: 8.w),
                      Text(
                        "Account Settings",
                        style: AppTextStyle.body2(
                          fontWeight: AppTextStyle.medium,
                          color: AppColor.Neutral900,
                        ),
                      ),
                    ],
                  ),
                  Icon(Icons.arrow_forward_ios_rounded, size: 15.w),
                ],
              ),
            ),
            SizedBox(height: 18.w),
            Padding(
              padding: EdgeInsets.only(left: 32.w),
              child: Divider(height: 1.h, color: AppColor.Neutral300),
            ),
            SizedBox(height: 32.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  "General",
                  style: AppTextStyle.body1(
                    fontWeight: AppTextStyle.semiBold,
                    color: AppColor.Neutral900,
                  ),
                ),
              ],
            ),
            SizedBox(height: 22.h),
            GestureDetector(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      SizedBox(
                        width: 16.w,
                        height: 16.w,
                        child: Image.asset("assets/profile/user.png"),
                      ),
                      SizedBox(width: 8.w),
                      Text(
                        "FaQs & Help",
                        style: AppTextStyle.body2(
                          fontWeight: AppTextStyle.medium,
                          color: AppColor.Neutral900,
                        ),
                      ),
                    ],
                  ),
                  Icon(Icons.arrow_forward_ios_rounded, size: 15.w),
                ],
              ),
            ),
            SizedBox(height: 18.w),
            Padding(
              padding: EdgeInsets.only(left: 32.w),
              child: Divider(height: 1.h, color: AppColor.Neutral300),
            ),
            SizedBox(height: 18.h),
            GestureDetector(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      SizedBox(
                        width: 16.w,
                        height: 16.w,
                        child: Image.asset("assets/profile/notification.png"),
                      ),
                      SizedBox(width: 8.w),
                      Text(
                        "Policies & Terms",
                        style: AppTextStyle.body2(
                          fontWeight: AppTextStyle.medium,
                          color: AppColor.Neutral900,
                        ),
                      ),
                    ],
                  ),
                  Icon(Icons.arrow_forward_ios_rounded, size: 15.w),
                ],
              ),
            ),
            SizedBox(height: 18.w),
            Padding(
              padding: EdgeInsets.only(left: 32.w),
              child: Divider(height: 1.h, color: AppColor.Neutral300),
            ),
            SizedBox(height: 18.h),
            GestureDetector(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      SizedBox(
                        width: 16.w,
                        height: 16.w,
                        child: Image.asset("assets/profile/setting.png"),
                      ),
                      SizedBox(width: 8.w),
                      Text(
                        "Give App Ratings",
                        style: AppTextStyle.body2(
                          fontWeight: AppTextStyle.medium,
                          color: AppColor.Neutral900,
                        ),
                      ),
                    ],
                  ),
                  Icon(Icons.arrow_forward_ios_rounded, size: 15.w),
                ],
              ),
            ),
            SizedBox(height: 18.w),
            Padding(
              padding: EdgeInsets.only(left: 32.w),
              child: Divider(height: 1.h, color: AppColor.Neutral300),
            ),
          ],
        ),
      );
    });
  }
}
