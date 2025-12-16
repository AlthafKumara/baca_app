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

  static void doubleBottomSheet({
    final int height = 400,
    final image,
    final String? title,
    final String? message,
    final String? primarybuttonText,
    final String? secondarybuttonText,
    final void Function()? onPressed,
  }) {
    Get.bottomSheet(
      backgroundColor: AppColor.Neutral100,
      isScrollControlled: true,
      Container(
        height: height.h,
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
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: CustomButtonLarge.outlinelarge(
                    text: secondarybuttonText!,
                    onPressed: () => Get.back(),
                  ),
                ),
                SizedBox(width: 8.w),
                Expanded(
                  child: CustomButtonLarge.primarylarge(
                    text: primarybuttonText!,
                    onPressed: onPressed,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  static void singleBottomSheetWidget({
    final String? title,
    final Widget? child,
    final int? height,
    final int? buttongap,
    final String? buttonText,
    final void Function()? onPressed,
  }) {
    Get.bottomSheet(
      backgroundColor: AppColor.Neutral100,
      isScrollControlled: true,
      SafeArea(
        top: false,
        child: SizedBox(
          height: height!.h,
          child: SingleChildScrollView(
            physics: const ClampingScrollPhysics(),
            child: ConstrainedBox(
              constraints: BoxConstraints(minHeight: height.h),
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.w),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    SizedBox(
                      width: 42.w,
                      child: Divider(
                        color: AppColor.Neutral300,
                        thickness: 6.h,
                        radius: BorderRadius.circular(999),
                      ),
                    ),
                    if (title != null) SizedBox(height: 12.h),
                    if (title != null)
                      Text(
                        title,
                        style: AppTextStyle.body1(
                          color: AppColor.Neutral900,
                          fontWeight: AppTextStyle.bold,
                        ),
                        textAlign: TextAlign.center,
                      ),

                    SizedBox(height: 16.h),

                    child ?? const SizedBox(),

                    SizedBox(height: buttongap?.h ?? 45.h),

                    Row(
                      children: [
                        Expanded(
                          child: CustomButtonLarge.outlinelarge(
                            text: buttonText ?? "Close",
                            onPressed: onPressed,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  static void doubleBottomSheetWidget({
    final String? title,

    final Widget? child,
    final int? height,

    final String? primarybuttonText,
    final String? secondarybuttonText,
    final void Function()? onPressed,
  }) {
    Get.bottomSheet(
      backgroundColor: AppColor.Neutral100,
      isScrollControlled: true,
      Container(
        height: height!.h,
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
            SizedBox(height: 12.h),
            if (title != null)
              Text(
                title,
                style: AppTextStyle.body1(
                  color: AppColor.Neutral900,
                  fontWeight: AppTextStyle.bold,
                ),
                textAlign: TextAlign.center,
              ),

            SizedBox(height: 16.h),

            child!,
            SizedBox(height: 45.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: CustomButtonLarge.outlinelarge(
                    text: secondarybuttonText!,
                    onPressed: () => Get.back(),
                  ),
                ),
                SizedBox(width: 8.w),
                Expanded(
                  child: CustomButtonLarge.primarylarge(
                    text: primarybuttonText!,
                    onPressed: onPressed,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
