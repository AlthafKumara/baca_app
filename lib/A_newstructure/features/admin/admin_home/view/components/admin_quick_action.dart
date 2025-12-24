import 'package:baca_app/A_newstructure/configs/routes/route.dart';
import 'package:baca_app/A_newstructure/constants/assets_constant.dart';
import 'package:baca_app/A_newstructure/shared/styles/app_color.dart';
import 'package:baca_app/A_newstructure/shared/styles/app_text_style.dart';
import 'package:flutter/widgets.dart';
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
                child: Image.asset(Assets.Icon_add_blue),
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
                child: Image.asset(Assets.Icon_book),
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
                child: Image.asset(Assets.Icon_transaction),
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
                child: Image.asset(Assets.Icon_scan),
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
