import 'package:baca_app/app/core/color/app_color.dart';
import 'package:baca_app/app/core/font/app_text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ReviewContainer extends StatelessWidget {
  const ReviewContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 22.h, horizontal: 16.w),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Review",
                style: AppTextStyle.body1(
                  color: AppColor.Neutral900,
                  fontWeight: AppTextStyle.medium,
                ),
              ),
              Text.rich(
                TextSpan(
                  text: "61",
                  style: AppTextStyle.body3(
                    color: AppColor.Neutral900,
                    fontWeight: AppTextStyle.medium,
                  ),
                  children: [
                    TextSpan(
                      text: "(Mostly Positive)",
                      style: AppTextStyle.body3(
                        color: AppColor.Neutral500,
                        fontWeight: AppTextStyle.regular,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          SizedBox(height: 12.h),
          SizedBox(
            width: 363.w,
            height: 150.h,
            child: Center(
              child: Text(
                "UPCOMING",
                style: AppTextStyle.body1(
                  fontWeight: AppTextStyle.medium,
                  color: AppColor.Neutral900,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
