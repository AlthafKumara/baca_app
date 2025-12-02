import 'package:baca_app/app/core/color/app_color.dart';
import 'package:baca_app/app/core/font/app_text_style.dart';
import 'package:baca_app/app/core/widget/button_large.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class CustomBottomSheet {
  CustomBottomSheet._();

  static void singleBottomSheet({
    final image,
    final String? title,
    final String? message,
    final String? buttonText,
    final void Function()? onPressed,
  }) {
    Get.bottomSheet(
      backgroundColor: AppColor.Neutral100,
      isScrollControlled: true,
      Container(
        height: 400.h,
        alignment: Alignment.center,
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        child: Column(
          children: [
            SizedBox(
              width: 42.w,
              child: Divider(
                color: AppColor.Neutral300,
                thickness: 6.h,
                radius: BorderRadius.circular(999),
              ),
            ),
            SizedBox(height: 24.h),
            Image.asset(image, width: 160.w),
            SizedBox(height: 16.h),
            Text(
              title!,
              style: AppTextStyle.heading5(
                color: AppColor.Neutral900,
                fontWeight: AppTextStyle.bold,
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 8.h),
            Text(
              message!,
              style: AppTextStyle.description2(
                color: AppColor.Neutral400,
                fontWeight: AppTextStyle.regular,
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 16.h),
            CustomButtonLarge.primarylarge(
              text: buttonText!,
              onPressed: onPressed,
            ),
          ],
        ),
      ),
    );
  }
}
