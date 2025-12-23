import 'package:baca_app/A_newstructure/shared/styles/app_color.dart';
import 'package:baca_app/A_newstructure/shared/styles/app_text_style.dart';
import 'package:flutter/material.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomChip {
  Widget filterChip({String? title, bool? selected, void Function()? onTap}) {
    return GestureDetector(
      onTap: onTap,
      child: Chip(
        backgroundColor: selected! ? AppColor.Primary500 : AppColor.Neutral200,
        side: BorderSide(
          color: selected ? Colors.transparent : AppColor.Neutral300,
          style: BorderStyle.solid,
          width: 1.w,
        ),
        // padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 9.h),
        labelStyle: selected
            ? AppTextStyle.body3(
                fontWeight: AppTextStyle.medium,
                color: AppColor.Neutral100,
              )
            : AppTextStyle.body3(
                fontWeight: AppTextStyle.medium,
                color: AppColor.Neutral900,
              ),

        label: Text(title!),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(999.r),
        ),
      ),
    );
  }

  Widget reviewChip({required int review}) {
    final reviewString = review.toString();
    return Chip(
      padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 6.h),
      labelPadding: EdgeInsets.zero,
      visualDensity: VisualDensity.compact,
      materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,

      backgroundColor: AppColor.Neutral200,
      side: BorderSide(
        color: AppColor.Neutral300,
        style: BorderStyle.solid,
        width: 1.w,
      ),

      labelStyle: AppTextStyle.body3(
        fontWeight: AppTextStyle.medium,
        color: AppColor.Neutral900,
      ),
      label: Row(
        children: [
          Icon(Icons.star_rounded, color: AppColor.Warning400, size: 16.w),
          SizedBox(width: 4.w),
          Text(
            "$reviewString/5",
            style: AppTextStyle.body3(
              fontWeight: AppTextStyle.medium,
              color: AppColor.Neutral900,
            ),
          ),
        ],
      ),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(999.r)),
    );
  }
}
