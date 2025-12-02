import 'package:baca_app/app/core/color/app_color.dart';
import 'package:baca_app/app/core/font/app_text_style.dart';
import 'package:baca_app/app/core/utils/validator.dart';
import 'package:baca_app/app/core/widget/button_large.dart';

import 'package:baca_app/app/modules/auth/controllers/auth_controller.dart';
import 'package:baca_app/app/modules/auth/widget/complete_profile_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';

class CompleteProfileView extends GetView<AuthController> {
  final controller = Get.find<AuthController>();
  Validator validator = Validator();

  CompleteProfileView({super.key});
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
                  image: AssetImage("assets/Logo.png"),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            SizedBox(width: 3.w),
            Text(
              "Baca",
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
          text: "Submit",
          onPressed: () {
            controller.handleCompleteProfile();
          },
        ),
      ),
    );
  }
}
