import 'package:baca_app/A_newstructure/constants/assets_constant.dart';
import 'package:baca_app/A_newstructure/features/auth/login/constants/login_constant.dart';
import 'package:baca_app/A_newstructure/features/auth/login/controllers/login_controller.dart';
import 'package:baca_app/A_newstructure/features/auth/login/view/components/login_body.dart';
import 'package:baca_app/A_newstructure/shared/styles/app_color.dart';
import 'package:baca_app/A_newstructure/shared/styles/app_text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class LoginView extends GetView<LoginController> {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
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
              Login.baca,
              style: AppTextStyle.heading4(
                color: AppColor.Neutral900,
                fontWeight: AppTextStyle.semiBold,
              ),
            ),
          ],
        ),
        centerTitle: true,
      ),
      body: LoginBody(),
      bottomNavigationBar: Padding(
        padding: EdgeInsetsGeometry.symmetric(vertical: 42.h),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              Login.dontHaveAccount,
              style: AppTextStyle.body2(
                color: AppColor.Neutral400,
                fontWeight: AppTextStyle.medium,
              ),
            ),
            GestureDetector(
              onTap: () => controller.toRegister(),
              child: Text(
                Login.registerHere,
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
