import 'package:baca_app/A_newstructure/constants/assets_constant.dart';
import 'package:baca_app/A_newstructure/features/auth/login/constants/login_constant.dart';
import 'package:baca_app/A_newstructure/features/auth/login/controllers/login_controller.dart';
import 'package:baca_app/A_newstructure/shared/styles/app_color.dart';
import 'package:baca_app/A_newstructure/shared/styles/app_text_style.dart';
import 'package:baca_app/A_newstructure/shared/widgets/button_large.dart';
import 'package:baca_app/A_newstructure/shared/widgets/textfield.dart';
import 'package:baca_app/A_newstructure/utils/functions/validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class LoginBody extends StatelessWidget {
  final controller = Get.find<LoginController>();
  final Validator validator = Validator();
  LoginBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: EdgeInsetsGeometry.symmetric(vertical: 40.h, horizontal: 16.w),
        child: Form(
          key: controller.loginkey,
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
                        Login.logintitle,
                        style: AppTextStyle.heading3(
                          color: AppColor.Neutral900,
                          fontWeight: AppTextStyle.bold,
                        ),
                      ),
                      SizedBox(height: 8.h),
                      Text(
                        Login.logindescription,
                        style: AppTextStyle.description2(
                          color: AppColor.Neutral400,
                          fontWeight: AppTextStyle.medium,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 32.h),
                  CustomTextfield.textFieldLarge(
                    prefixicon: Image.asset(Assets.Icon_email, width: 20.w),
                    label: Login.labelemail,
                    hintText: Login.hintemail,
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
                      prefixicon: Image.asset(Assets.Icon_lock, width: 20.w),
                      suffixicon: GestureDetector(
                        onTap: () {
                          controller.handleObsecure();
                        },
                        child: Image.asset(Assets.Icon_eye, width: 20.w),
                      ),
                      label: Login.labelpassword,
                      hintText: Login.hintpassword,
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
                        Login.forgotPassword,
                        style: AppTextStyle.body2(
                          color: AppColor.Neutral400,
                          fontWeight: AppTextStyle.medium,
                        ),
                      ),
                      Text(
                        Login.resetPassword,
                        style: AppTextStyle.body2(
                          color: AppColor.Primary500,
                          fontWeight: AppTextStyle.bold,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 24.h),
                  CustomButtonLarge.primarylarge(
                    text: Login.loginbutton,
                    onPressed: () {
                      controller.handleLogin();
                    },
                  ),
                  SizedBox(height: 16.h),

                  CustomButtonLarge.outlinelarge(
                    prefixicon: Image.asset(Assets.Image_google, width: 20.w),
                    text: Login.loginGoogle,
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
