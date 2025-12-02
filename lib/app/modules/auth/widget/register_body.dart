import 'package:baca_app/app/core/color/app_color.dart';
import 'package:baca_app/app/core/font/app_text_style.dart';
import 'package:baca_app/app/core/utils/validator.dart';
import 'package:baca_app/app/core/widget/button_large.dart';
import 'package:baca_app/app/core/widget/textfield.dart';
import 'package:baca_app/app/modules/auth/controllers/auth_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class RegisterBody extends StatelessWidget {
  final controller = Get.find<AuthController>();
  RegisterBody({super.key});
  Validator validator = Validator();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 40.h, horizontal: 16.w),
        child: Form(
          key: controller.registerkey,
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
                        "Create your account",
                        style: AppTextStyle.heading3(
                          color: AppColor.Neutral900,
                          fontWeight: AppTextStyle.bold,
                        ),
                      ),
                      SizedBox(height: 8.h),
                      Text(
                        "Create a new account so you can read lots of insteresting books",
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
                      "assets/auth/icon/email.png",
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
                        "assets/auth/icon/lock.png",
                        width: 20.w,
                      ),
                      suffixicon: GestureDetector(
                        onTap: () {
                          controller.handleObsecure();
                        },
                        child: Image.asset(
                          "assets/auth/icon/eye.png",
                          width: 20.w,
                        ),
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
                  SizedBox(height: 20.h),
                  Obx(
                    () => CustomTextfield.textFieldLarge(
                      prefixicon: Image.asset(
                        "assets/auth/icon/lock.png",
                        width: 20.w,
                      ),
                      suffixicon: GestureDetector(
                        onTap: () {
                          controller.handleObsecure();
                        },
                        child: Image.asset(
                          "assets/auth/icon/eye.png",
                          width: 20.w,
                        ),
                      ),
                      label: "Confirm password",
                      hintText: "Input your password again",
                      controller: controller.confirmpasswordController,
                      isObsecureText: controller.isObsecureText.value,
                      maxLines: 1,
                      keyBoardType: TextInputType.visiblePassword,
                      enabled: true,
                      validator: (value) {
                        return validator.validatorConfirmPassword(
                          value,
                          controller.passwordController.text,
                        );
                      },
                    ),
                  ),
                  SizedBox(height: 40.h),

                  Obx(
                    () => CustomButtonLarge.primarylarge(
                      isLoading: controller.isLoading.value,
                      text: "Register",
                      onPressed: () {
                        controller.handleRegister();
                      },
                    ),
                  ),
                  SizedBox(height: 16.h),

                  CustomButtonLarge.outlinelarge(
                    prefixicon: Image.asset(
                      "assets/auth/icon/google.png",
                      width: 20.w,
                    ),
                    text: "Register With Google",
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
