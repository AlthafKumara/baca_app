import 'package:baca_app/app/core/color/app_color.dart';
import 'package:baca_app/app/core/font/app_text_style.dart';
import 'package:baca_app/app/core/widget/button_large.dart';
import 'package:baca_app/app/core/widget/textfield.dart';
import 'package:baca_app/app/modules/auth/controllers/auth_controller.dart';
import 'package:baca_app/app/modules/auth/utils/validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class LoginBody extends StatelessWidget {
  final controller = Get.find<AuthController>();
  final Validator validator = Validator();
  LoginBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: EdgeInsetsGeometry.symmetric(vertical: 40.h, horizontal: 16.w),
        child: Form(
          key: controller.key,
          child: ListView(
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Welcome back!",
                        style: AppTextStyle.heading3(
                          color: AppColor.Neutral900,
                          fontWeight: AppTextStyle.bold,
                        ),
                      ),
                      SizedBox(height: 8.h),
                      Text(
                        "You can log into your account first to read many interesting books!",
                        style: AppTextStyle.description2(
                          color: AppColor.Neutral400,
                          fontWeight: AppTextStyle.medium,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 32.h),
                  CustomTextfield.textFieldLarge(
                    prefixicon: Image.asset(
                      "assets/icon/email.png",
                      width: 20.w,
                    ),
                    label: "Email",
                    hintText: "youremail@gmail.com",
                    controller: controller.emailController,
                    isObsecureText: false,
                    maxLines: 1,
                    keyBoardType: TextInputType.emailAddress,
                    enabled: true,
                    validator: validator.validatorEmail,
                  ),
                  SizedBox(height: 20.h),
                  Obx(
                    () => CustomTextfield.textFieldLarge(
                      prefixicon: Image.asset(
                        "assets/icon/lock.png",
                        width: 20.w,
                      ),
                      suffixicon: GestureDetector(
                        onTap: () {
                          controller.handleObsecure();
                        },
                        child: Image.asset("assets/icon/eye.png", width: 20.w),
                      ),
                      label: "Password",
                      hintText: "Input Your Password",
                      controller: controller.passwordController,
                      isObsecureText: controller.isObsecureText.value,
                      maxLines: 1,
                      keyBoardType: TextInputType.visiblePassword,
                      enabled: true,
                      validator: validator.validatorPassword,
                    ),
                  ),
                  SizedBox(height: 40.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Forgot Your Password?",
                        style: AppTextStyle.body2(
                          color: AppColor.Neutral400,
                          fontWeight: AppTextStyle.medium,
                        ),
                      ),
                      Text(
                        " Reset Here",
                        style: AppTextStyle.body2(
                          color: AppColor.Primary500,
                          fontWeight: AppTextStyle.bold,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 24.h),
                  CustomButtonLarge.primarylarge(
                    text: "Login",
                    onPressed: () {
                      controller.handleLogin();
                    },
                  ),
                  SizedBox(height: 16.h),

                  CustomButtonLarge.outlinelarge(
                    prefixicon: Image.asset(
                      "assets/icon/google.png",
                      width: 20.w,
                    ),
                    text: "Login With Google",
                    onPressed: () {},
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
