import 'package:baca_app/A_laststructure/app/modules/auth/widget/complete_profile_body.dart';
import 'package:baca_app/A_newstructure/constants/assets_constant.dart';
import 'package:baca_app/A_newstructure/features/auth/complete_profile/constants/complete_profile_constant.dart';
import 'package:baca_app/A_newstructure/features/auth/complete_profile/controllers/complete_profile_controller.dart';
import 'package:baca_app/A_newstructure/shared/styles/app_color.dart';
import 'package:baca_app/A_newstructure/shared/styles/app_text_style.dart';
import 'package:baca_app/A_newstructure/shared/widgets/button_large.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class CompleteProfileView extends GetView<CompleteProfileController> {
  const CompleteProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.Neutral100,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        scrolledUnderElevation: 0,
        backgroundColor: AppColor.Neutral100,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
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
            SizedBox(width: 3.w),
            Text(
              CompleteProfile.baca,
              style: AppTextStyle.heading4(
                color: AppColor.Neutral900,
                fontWeight: AppTextStyle.semiBold,
              ),
            ),
          ],
        ),
        centerTitle: true,
      ),
      body: CompleteProfileBody(),
      bottomNavigationBar: Padding(
        padding: EdgeInsetsGeometry.symmetric(vertical: 42.h, horizontal: 16.w),
        child: CustomButtonLarge.primarylarge(
          text: CompleteProfile.submitButton,
          onPressed: () {
            controller.handleCompleteProfile();
          },
        ),
      ),
    );
  }
}
