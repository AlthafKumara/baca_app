import 'package:baca_app/A_laststructure/app/core/utils/validator.dart';
import 'package:baca_app/A_newstructure/constants/assets_constant.dart';
import 'package:baca_app/A_newstructure/features/auth/complete_profile/constants/complete_profile_constant.dart';
import 'package:baca_app/A_newstructure/features/auth/complete_profile/controllers/complete_profile_controller.dart';
import 'package:baca_app/A_newstructure/shared/styles/app_color.dart';
import 'package:baca_app/A_newstructure/shared/styles/app_text_style.dart';
import 'package:baca_app/A_newstructure/shared/widgets/textfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class CompleteProfileBody extends StatelessWidget {
  final controller = Get.find<CompleteProfileController>();
  CompleteProfileBody({super.key});

  final validator = Validator();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: EdgeInsetsGeometry.symmetric(vertical: 40.h, horizontal: 16.w),
        child: Form(
          key: controller.completeprofilekey,
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
                        CompleteProfile.title,
                        style: AppTextStyle.heading3(
                          color: AppColor.Neutral900,
                          fontWeight: AppTextStyle.bold,
                        ),
                      ),
                      SizedBox(height: 8.h),
                      Text(
                        CompleteProfile.description,
                        style: AppTextStyle.description2(
                          color: AppColor.Neutral400,
                          fontWeight: AppTextStyle.medium,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 32.h),
                  Obx(() {
                    final photo = controller.selectedImage.value;

                    return SizedBox(
                      width: 80.w,
                      height: 80.w,
                      child: CircleAvatar(
                        backgroundColor: AppColor.Neutral250,
                        backgroundImage: photo != null
                            ? FileImage(photo)
                            : null,
                        child: photo == null
                            ? Icon(
                                Icons.person,
                                size: 40.sp,
                                color: AppColor.Neutral100,
                              )
                            : null,
                      ),
                    );
                  }),
                  SizedBox(height: 8.h),
                  TextButton(
                    onPressed: () {
                      controller.pickImage();
                    },
                    child: Text(
                      CompleteProfile.changePhoto,
                      style: AppTextStyle.body2(
                        fontWeight: AppTextStyle.semiBold,
                        color: AppColor.Primary500,
                      ),
                    ),
                  ),
                  SizedBox(height: 28.h),
                  CustomTextfield.textFieldLarge(
                    label: CompleteProfile.nameLabel,
                    hintText: CompleteProfile.nameHint,
                    controller: controller.nameController,
                    isObsecureText: false,
                    maxLines: 1,
                    keyBoardType: TextInputType.name,
                    enabled: true,
                    validator: validator.validatorName,
                  ),
                  SizedBox(height: 20.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        CompleteProfile.genderLabel,
                        style: AppTextStyle.body2(
                          color: AppColor.Neutral900,
                          fontWeight: AppTextStyle.medium,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 6.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Obx(
                          () => genderOption(
                            image: Assets.Image_male,
                            label: CompleteProfile.female,
                            value: CompleteProfile.female,
                            selected:
                                controller.gender.value ==
                                CompleteProfile.female,
                            onSelect: (v) => controller.gender.value = v,
                          ),
                        ),
                      ),
                      SizedBox(width: 16.w),

                      Expanded(
                        child: Obx(
                          () => genderOption(
                            image: Assets.Image_female,
                            label: CompleteProfile.female,
                            value: CompleteProfile.female,
                            selected:
                                controller.gender.value ==
                                CompleteProfile.female,
                            onSelect: (v) => controller.gender.value = v,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget genderOption({
    final String? image,
    final String? label,
    final String? value,
    final bool? selected,
    final Function(String)? onSelect,
  }) {
    return GestureDetector(
      onTap: () => onSelect!(value!),
      child: AnimatedContainer(
        duration: Duration(milliseconds: 200),
        curve: Curves.easeInOut,
        padding: EdgeInsets.all(16.w),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20.r),
          border: Border.all(
            color: selected! ? AppColor.Primary600 : Colors.transparent,
            width: 2.w,
          ),
          boxShadow: [
            BoxShadow(
              blurRadius: 6,
              spreadRadius: 1,
              color: Colors.black.withOpacity(0.05),
            ),
          ],
          color: Colors.white,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            Image.asset(image!, width: 45.w, height: 45.w, fit: BoxFit.contain),
            SizedBox(height: 10.h),
            Text(
              label!,
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
                color: selected ? AppColor.Primary600 : AppColor.Neutral900,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
