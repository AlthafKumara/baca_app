import 'package:baca_app/A_newstructure/configs/routes/route.dart';
import 'package:baca_app/A_newstructure/constants/assets_constant.dart';
import 'package:baca_app/A_newstructure/shared/controllers/auth_controller.dart';
import 'package:baca_app/A_newstructure/shared/models/profile_model.dart';
import 'package:baca_app/A_newstructure/shared/styles/app_color.dart';
import 'package:baca_app/A_newstructure/shared/styles/app_text_style.dart';
import 'package:baca_app/A_newstructure/shared/widgets/bottom_sheet.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class UserAccountSettingView extends StatelessWidget {
  final authC = Get.find<AuthController>();
  UserAccountSettingView({super.key});
  final ProfileModel? profile = Get.arguments;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.Neutral100,
      appBar: AppBar(
        backgroundColor: AppColor.Neutral100,
        leading: IconButton(
          onPressed: () {
            Get.back();
          },
          icon: Icon(
            Icons.arrow_back_rounded,
            color: AppColor.Neutral900,
            size: 24.w,
          ),
        ),
        title: Text(
          'Account Settings',
          style: AppTextStyle.body1(fontWeight: AppTextStyle.semiBold),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 20.h),
        child: ListView(
          children: [
            cardController(
              image: Assets.Icon_email,
              message: "If you want to switch to a new email or password.",
              title: "Change Auth",
              onTap: () {
                Get.toNamed(Routes.USER_CHANGE_AUTH, arguments: profile);
              },
            ),
            SizedBox(height: 16.h),
            cardController(
              image: Assets.Icon_logout,
              message: "Sign out of your currently connected account in Baca.",
              title: "Logout",
              onTap: () {
                CustomBottomSheet.doubleBottomSheet(
                  image: Assets.Ilustration_logout,
                  title: "Logout from this account?",
                  primarybuttonText: "Yes, Logout",
                  secondarybuttonText: "No, Cancel",
                  message:
                      "Are you sure you want to logout from this account? You can login again to this account!",
                  onPressed: () {
                    authC.handleLogout();
                  },
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget cardController({
    String? image,
    String? title,
    String? message,
    void Function()? onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: AppColor.Neutral100,
          borderRadius: BorderRadius.circular(12.r),
          border: Border.all(
            color: AppColor.Neutral300,
            width: 1.w,
            style: BorderStyle.solid,
          ),
        ),
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(width: 20.w, height: 20.w, child: Image.asset(image!)),
            SizedBox(width: 12.w),
            SizedBox(
              width: 253.w,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title!,
                    style: AppTextStyle.body2(
                      fontWeight: AppTextStyle.semiBold,
                      color: AppColor.Neutral900,
                    ),
                  ),
                  SizedBox(height: 8.h),
                  Text(
                    message!,
                    style: AppTextStyle.description3(
                      fontWeight: AppTextStyle.regular,

                      color: AppColor.Neutral400,
                    ),
                    maxLines: 2,
                  ),
                ],
              ),
            ),
            SizedBox(width: 12.w),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.arrow_forward_ios_rounded,
                  size: 20.sp,
                  color: AppColor.Neutral900,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
