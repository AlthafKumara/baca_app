import 'package:baca_app/A_newstructure/constants/assets_constant.dart';
import 'package:baca_app/A_newstructure/features/admin/admin_profile/controllers/admin_profile_controller.dart';
import 'package:baca_app/A_newstructure/shared/controllers/get_profile_controller.dart';
import 'package:baca_app/A_newstructure/shared/styles/app_color.dart';
import 'package:baca_app/A_newstructure/shared/styles/app_text_style.dart';
import 'package:baca_app/A_newstructure/shared/widgets/profile_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class AdminProfileBody extends GetView<AdminProfileController> {
  const AdminProfileBody({super.key});

  @override
  Widget build(BuildContext context) {
    final profC = Get.find<ProfileController>();
    return Obx(() {
      final profile = profC.profile.value;

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
                        ? NetworkImage(profC.profile.value!.photoProfile!)
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
            ProfileList(
              imageAsset: Assets.Icon_user,
              title: "Personal Details",
              onTap: () => controller.toPersonalDetail(profile: profile),
            ),
            SizedBox(height: 18.w),
            Padding(
              padding: EdgeInsets.only(left: 32.w),
              child: Divider(height: 1.h, color: AppColor.Neutral300),
            ),
            SizedBox(height: 18.h),
            ProfileList(
              imageAsset: Assets.Icon_notification,
              title: "Notification",
              onTap: () => controller.toNotification(),
            ),
            SizedBox(height: 18.w),
            Padding(
              padding: EdgeInsets.only(left: 32.w),
              child: Divider(height: 1.h, color: AppColor.Neutral300),
            ),
            SizedBox(height: 18.h),
            ProfileList(
              imageAsset: Assets.Icon_setting,
              title: "Account Settings",
              onTap: () => controller.toAccountSetting(profile: profile),
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
            ProfileList(imageAsset: Assets.Icon_user, title: "FaQs and Help"),
            SizedBox(height: 18.w),
            Padding(
              padding: EdgeInsets.only(left: 32.w),
              child: Divider(height: 1.h, color: AppColor.Neutral300),
            ),
            SizedBox(height: 18.h),
            ProfileList(
              imageAsset: Assets.Icon_notification,
              title: "Policies and Terms",
            ),
            SizedBox(height: 18.w),
            Padding(
              padding: EdgeInsets.only(left: 32.w),
              child: Divider(height: 1.h, color: AppColor.Neutral300),
            ),
            SizedBox(height: 18.h),
            ProfileList(
              imageAsset: Assets.Icon_setting,
              title: "Give APP Ratings",
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
