import 'package:baca_app/A_newstructure/configs/routes/route.dart';
import 'package:baca_app/A_newstructure/constants/assets_constant.dart';
import 'package:baca_app/A_newstructure/features/auth/onboarding/constants/onboarding_constant.dart';
import 'package:baca_app/A_newstructure/features/auth/onboarding/controllers/onboarding_controller.dart';
import 'package:baca_app/A_newstructure/shared/styles/app_color.dart';
import 'package:baca_app/A_newstructure/shared/styles/app_text_style.dart';
import 'package:baca_app/A_newstructure/shared/widgets/button_large.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';

class OnboardingView extends GetView<OnboardingController> {
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
                        image: AssetImage(Assets.Image_onboarding),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 12),
                Text(
                  Onboarding.title,
                  style: AppTextStyle.heading2(
                    color: AppColor.Neutral900,
                    fontWeight: AppTextStyle.semiBold,
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 12),
                Text(
                  Onboarding.description,
                  style: AppTextStyle.description2(
                    color: AppColor.Neutral400,
                    fontWeight: AppTextStyle.medium,
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 49.h),
                CustomButtonLarge.primarylarge(
                  onPressed: () {
                    controller.toLogin();
                  },
                  text: Onboarding.buttonLogin,
                ),
                SizedBox(height: 12.h),
                CustomButtonLarge.outlinelarge(
                  onPressed: () {
                    controller.toRegister();
                  },
                  text: Onboarding.buttonRegister,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
