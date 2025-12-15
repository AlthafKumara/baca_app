import 'package:baca_app/app/core/color/app_color.dart';
import 'package:baca_app/app/core/constant/asset_constant.dart';
import 'package:baca_app/app/core/font/app_text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AdminSearchEmpty extends StatelessWidget {
  const AdminSearchEmpty({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SizedBox(
          height: 160.w,
          width: 160.w,
          child: Image.asset(Assets.Assets_library_ilustration_search),
        ),
        SizedBox(height: 20.h),
        Text(
          "No matches data found",
          style: AppTextStyle.heading5(
            fontWeight: AppTextStyle.medium,
            color: AppColor.Neutral900,
          ),
        ),
        SizedBox(height: 8.h),
        Text(
          "There is no matches data that you search. Try using different keyword!",
          style: AppTextStyle.description2(
            fontWeight: AppTextStyle.regular,
            color: AppColor.Neutral400,
          ),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}
