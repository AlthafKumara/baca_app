import 'package:baca_app/app/core/color/app_color.dart';
import 'package:baca_app/app/core/font/app_text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DescriptionBook extends StatelessWidget {
  final int stock;
  final String author;
  const DescriptionBook({super.key, required this.stock, required this.author});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 22.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Expanded(
                child: SizedBox(
                  width: 100.w,
                  child: Text(
                    "Stock",
                    style: AppTextStyle.description2(
                      fontWeight: AppTextStyle.medium,
                      color: AppColor.Neutral400,
                    ),
                  ),
                ),
              ),
              Expanded(
                child: Text(
                  "${stock.toString()} Stock",
                  style: AppTextStyle.description2(
                    fontWeight: AppTextStyle.medium,
                    color: AppColor.Neutral900,
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 12.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Expanded(
                child: SizedBox(
                  width: 100.w,
                  child: Text(
                    "Borrowed By",
                    style: AppTextStyle.description2(
                      fontWeight: AppTextStyle.medium,
                      color: AppColor.Neutral400,
                    ),
                  ),
                ),
              ),
              Expanded(
                child: Text(
                  "10 People",
                  style: AppTextStyle.description2(
                    fontWeight: AppTextStyle.medium,
                    color: AppColor.Neutral900,
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 12.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Expanded(
                child: SizedBox(
                  width: 100.w,
                  child: Text(
                    "Writer",
                    style: AppTextStyle.description2(
                      fontWeight: AppTextStyle.medium,
                      color: AppColor.Neutral400,
                    ),
                  ),
                ),
              ),
              Expanded(
                child: Text(
                  author,
                  style: AppTextStyle.description2(
                    fontWeight: AppTextStyle.medium,
                    color: AppColor.Neutral900,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
