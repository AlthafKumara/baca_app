import 'package:baca_app/app/core/color/app_color.dart';
import 'package:baca_app/app/core/constant/asset_constant.dart';
import 'package:baca_app/app/core/font/app_text_style.dart';
import 'package:baca_app/app/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class QuickActions extends StatelessWidget {
  const QuickActions({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        GestureDetector(
          onTap: () {
            Get.toNamed(Routes.ADMIN_FORMBOOK);
          },
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                width: 25.w,
                height: 25.w,
                child: Image.asset(Assets.Assets_home_add),
              ),
              SizedBox(height: 6.h),
              Text(
                "New Book",
                style: AppTextStyle.body3(
                  fontWeight: AppTextStyle.medium,
                  color: AppColor.Primary500,
                ),
              ),
            ],
          ),
        ),
        GestureDetector(
          onTap: () {
            Get.offNamed(Routes.ADMIN_LIBRARY);
          },
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                width: 25.w,
                height: 25.w,
                child: Image.asset(Assets.Assets_home_book),
              ),
              SizedBox(height: 6.h),
              Text(
                "Books",
                style: AppTextStyle.body3(
                  fontWeight: AppTextStyle.medium,
                  color: AppColor.Primary500,
                ),
              ),
            ],
          ),
        ),
        GestureDetector(
          onTap: () {
            Get.offNamed(Routes.ADMIN_LIBRARY);
          },
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                width: 25.w,
                height: 25.w,
                child: Image.asset(Assets.Assets_home_transaction),
              ),
              SizedBox(height: 6.h),
              Text(
                "Transaction",
                style: AppTextStyle.body3(
                  fontWeight: AppTextStyle.medium,
                  color: AppColor.Primary500,
                ),
              ),
            ],
          ),
        ),
        GestureDetector(
          onTap: () {
            Get.toNamed(Routes.ADMIN_SCAN);
          },
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                width: 25.w,
                height: 25.w,
                child: Image.asset(Assets.Assets_home_scan),
              ),
              SizedBox(height: 6.h),
              Text(
                "Scan QR",
                style: AppTextStyle.body3(
                  fontWeight: AppTextStyle.medium,
                  color: AppColor.Primary500,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
