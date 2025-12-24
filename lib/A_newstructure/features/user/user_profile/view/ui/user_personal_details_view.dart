import 'package:baca_app/A_newstructure/constants/assets_constant.dart';
import 'package:baca_app/A_newstructure/shared/controllers/get_profile_controller.dart';
import 'package:baca_app/A_newstructure/shared/models/profile_model.dart';
import 'package:baca_app/A_newstructure/shared/styles/app_color.dart';
import 'package:baca_app/A_newstructure/shared/styles/app_text_style.dart';
import 'package:baca_app/A_newstructure/shared/widgets/button_medium.dart';
import 'package:baca_app/A_newstructure/shared/widgets/textfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class UserPersonalDetailsView extends StatelessWidget {
  final controller = Get.find<ProfileController>();
  UserPersonalDetailsView({super.key});

  final ProfileModel profile = Get.arguments;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.Neutral100,
      appBar: AppBar(
        backgroundColor: AppColor.Neutral100,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_rounded,
            color: AppColor.Neutral900,
            size: 24.w,
          ),
          onPressed: () => Get.back(),
        ),
        title: Text(
          'Personal Details',
          style: AppTextStyle.body1(
            color: AppColor.Neutral900,
            fontWeight: AppTextStyle.semiBold,
          ),
        ),
        centerTitle: true,
        actionsPadding: EdgeInsets.only(right: 16.w),
        actions: [
          CustomButtonMedium.primaryMedium(
            text: "Edit",
            color: AppColor.Primary500,
            isLoading: false,
            onPressed: () {},
          ),
        ],
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(vertical: 28.h, horizontal: 16.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  width: 80.w,
                  height: 80.w,
                  child: CircleAvatar(
                    backgroundImage: profile.photoProfile != null
                        ? NetworkImage(profile.photoProfile!)
                        : null,

                    child: profile.photoProfile != null
                        ? null
                        : Icon(Icons.person),
                  ),
                ),
              ],
            ),
            SizedBox(height: 24.h),
            CustomTextfield.textFieldLarge(
              label: "Full Name",
              enabled: false,
              controller: TextEditingController(text: profile.name),

              textAlign: TextAlign.start,
              isObsecureText: false,
            ),
            SizedBox(height: 20.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  "Gender",
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
                      label: "Male",
                      value: "Male",
                      selected: controller.profile.value!.gender == "Male",
                    ),
                  ),
                ),
                SizedBox(width: 16.w),

                Expanded(
                  child: Obx(
                    () => genderOption(
                      image: Assets.Image_female,
                      label: "Female",
                      value: "Female",
                      selected: controller.profile.value!.gender == "Female",
                    ),
                  ),
                ),
              ],
            ),
          ],
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
