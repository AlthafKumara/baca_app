import 'package:baca_app/A_laststructure/app/core/color/app_color.dart';
import 'package:baca_app/A_laststructure/app/core/font/app_text_style.dart';
import 'package:baca_app/A_laststructure/app/core/widget/button_large.dart';
import 'package:baca_app/A_laststructure/app/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';

class OnboardingView extends GetView {
  const OnboardingView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.Neutral100,
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: EdgeInsetsGeometry.symmetric(vertical: 32, horizontal: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(24.r),
                      image: DecorationImage(
                        image: AssetImage("assets/auth/onboard.png"),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 12),
                Text(
                  "Borrow library books easily and quickly!",
                  style: AppTextStyle.heading2(
                    color: AppColor.Neutral900,
                    fontWeight: AppTextStyle.semiBold,
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 12),
                Text(
                  "Borrow library books easily and conveniently, with quick access anytime, anywhere.",
                  style: AppTextStyle.description2(
                    color: AppColor.Neutral400,
                    fontWeight: AppTextStyle.medium,
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 49.h),
                CustomButtonLarge.primarylarge(
                  onPressed: () {
                    Get.offAllNamed(Routes.LOGIN);
                  },
                  text: "Get Started",
                ),
                SizedBox(height: 12.h),
                CustomButtonLarge.outlinelarge(
                  onPressed: () {
                    Get.offAllNamed(Routes.REGISTER);
                  },
                  text: "I'm  new, sign me up",
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
