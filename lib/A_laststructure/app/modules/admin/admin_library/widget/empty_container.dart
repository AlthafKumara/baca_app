import 'package:baca_app/A_laststructure/app/core/color/app_color.dart';
import 'package:baca_app/A_laststructure/app/core/font/app_text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class EmptyContainer extends StatelessWidget {
  const EmptyContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: double.infinity,
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              width: 160.w,
              height: 160.w,
              child: Image.asset("assets/library/ilustration.png"),
            ),
            SizedBox(height: 20.h),
            Text(
              "No book found",
              style: AppTextStyle.heading5(
                fontWeight: AppTextStyle.medium,
                color: AppColor.Neutral900,
              ),
            ),
            SizedBox(height: 8.h),
            Text(
              "Book data in this category is empty",
              style: AppTextStyle.description2(
                fontWeight: AppTextStyle.medium,
                color: AppColor.Neutral400,
              ),
            ),
          ],
        ),
      ),
    );
    ;
  }
}
