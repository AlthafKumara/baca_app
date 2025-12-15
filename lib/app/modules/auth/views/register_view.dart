import 'package:baca_app/app/core/color/app_color.dart';
import 'package:baca_app/app/core/constant/asset_constant.dart';
import 'package:baca_app/app/core/font/app_text_style.dart';
import 'package:baca_app/app/core/utils/validator.dart';
import 'package:baca_app/app/modules/auth/controllers/auth_controller.dart';
import 'package:baca_app/app/modules/auth/widget/register_body.dart';
import 'package:baca_app/app/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';

class RegisterView extends GetView<AuthController> {
  final controller = Get.find<AuthController>();
  RegisterView({super.key});
  final Validator validator = Validator();
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
      body: RegisterBody(),
      bottomNavigationBar: Padding(
        padding: EdgeInsetsGeometry.symmetric(vertical: 42.h),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Have an account?",
              style: AppTextStyle.body2(
                color: AppColor.Neutral400,
                fontWeight: AppTextStyle.medium,
              ),
            ),
            GestureDetector(
              onTap: () => Get.offNamed(Routes.LOGIN),
              child: Text(
                " Login",
                style: AppTextStyle.body2(
                  color: AppColor.Primary500,
                  fontWeight: AppTextStyle.bold,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
