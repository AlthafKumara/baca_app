import 'package:baca_app/A_newstructure/constants/assets_constant.dart';
import 'package:baca_app/A_newstructure/features/auth/register/constants/register_constant.dart';
import 'package:baca_app/A_newstructure/features/auth/register/controllers/register_controller.dart';
import 'package:baca_app/A_newstructure/shared/styles/app_color.dart';
import 'package:baca_app/A_newstructure/shared/styles/app_text_style.dart';
import 'package:baca_app/A_newstructure/shared/widgets/button_large.dart';
import 'package:baca_app/A_newstructure/shared/widgets/textfield.dart';
import 'package:baca_app/A_newstructure/utils/functions/validator.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_instance/get_instance.dart';
import 'package:get/state_manager.dart';

class RegisterBody extends StatelessWidget {
  final controller = Get.find<RegisterController>();
  RegisterBody({super.key});

  final validator = Validator();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 40.h, horizontal: 16.w),
        child: Form(
          key: controller.registerKey,
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
                        Register.title,
                        style: AppTextStyle.heading3(
                          color: AppColor.Neutral900,
                          fontWeight: AppTextStyle.bold,
                        ),
                      ),
                      SizedBox(height: 8.h),
                      Text(
                        Register.description,
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
                    label: Register.emaillabel,
                    hintText: Register.emailHint,
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
                      label: Register.passwordlabel,
                      hintText: Register.passwordHint,
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
                      prefixicon: Image.asset(Assets.Icon_lock, width: 20.w),
                      suffixicon: GestureDetector(
                        onTap: () {
                          controller.handleObsecure();
                        },
                        child: Image.asset(Assets.Icon_eye, width: 20.w),
                      ),
                      label: Register.confirmPasswordlabel,
                      hintText: Register.confirmPasswordHint,
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

                  CustomButtonLarge.primarylarge(
                    text: Register.registerButton,
                    onPressed: () {
                      controller.handleRegister();
                    },
                  ),

                  SizedBox(height: 16.h),

                  CustomButtonLarge.outlinelarge(
                    prefixicon: Image.asset(Assets.Image_google, width: 20.w),
                    text: Register.registerGoogle,
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
