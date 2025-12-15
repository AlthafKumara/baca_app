import 'package:baca_app/app/core/color/app_color.dart';
import 'package:baca_app/app/core/constant/asset_constant.dart';
import 'package:baca_app/app/core/font/app_text_style.dart';
import 'package:baca_app/app/core/utils/validator.dart';
import 'package:baca_app/app/core/widget/button_large.dart';
import 'package:baca_app/app/core/widget/textfield.dart';
import 'package:baca_app/app/data/model/profiles_model.dart';
import 'package:baca_app/app/modules/auth/controllers/auth_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';

class AdminChangeAuthView extends StatelessWidget {
  final authC = Get.find<AuthController>();
  final Profile? profile = Get.arguments;
  AdminChangeAuthView({super.key}) {
    authC.emailController.text = profile?.email ?? '';
  }

  Validator validator = Validator();

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
          'Change Auth',
          style: AppTextStyle.body1(fontWeight: AppTextStyle.semiBold),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
        child: Form(
          key: authC.changeAuhtkey,
          child: ListView(
            children: [
              CustomTextfield.textFieldLarge(
                prefixicon: Image.asset(
                  Assets.Assets_auth_icon_email,
                  width: 20.w,
                ),
                label: "Email",
                hintText: "Input your email",
                controller: authC.emailController,
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
                    Assets.Assets_auth_icon_lock,
                    width: 20.w,
                  ),
                  suffixicon: GestureDetector(
                    onTap: () {
                      authC.handleObsecure();
                    },
                    child: Image.asset(
                      Assets.Assets_auth_icon_eye,
                      width: 20.w,
                    ),
                  ),
                  label: "Password",
                  hintText: "Input Your Password",
                  controller: authC.passwordController,
                  isObsecureText: authC.isObsecureText.value,
                  maxLines: 1,
                  keyBoardType: TextInputType.visiblePassword,
                  enabled: true,
                  validator: validator.validatorPasswordChangeAuth,
                ),
              ),
              SizedBox(height: 20.h),
              Obx(
                () => CustomTextfield.textFieldLarge(
                  prefixicon: Image.asset(
                    Assets.Assets_auth_icon_lock,
                    width: 20.w,
                  ),
                  suffixicon: GestureDetector(
                    onTap: () {
                      authC.handleObsecure();
                    },
                    child: Image.asset(
                      Assets.Assets_auth_icon_eye,
                      width: 20.w,
                    ),
                  ),
                  label: "Confirm password",
                  hintText: "Input your password again",
                  controller: authC.confirmpasswordController,
                  isObsecureText: authC.isObsecureText.value,
                  maxLines: 1,
                  keyBoardType: TextInputType.visiblePassword,
                  enabled: true,
                  validator: (value) {
                    return validator.validatorConfirmPasswordChangeAuth(
                      value,
                      authC.passwordController.text,
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 33.h),
        child: CustomButtonLarge.primarylarge(
          isLoading: authC.isLoading.value,
          text: "Save",
          onPressed: () {
            authC.handleUpdateEmailPassword();
          },
        ),
      ),
    );
  }
}
