import 'package:baca_app/A_newstructure/constants/assets_constant.dart';
import 'package:baca_app/A_newstructure/shared/styles/app_color.dart';
import 'package:baca_app/A_newstructure/shared/styles/app_text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class ProfileList extends StatelessWidget {
  final String imageAsset;
  final String title;
  final void Function()? onTap;
  const ProfileList({
    super.key,
    required this.imageAsset,
    required this.title,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              SizedBox(
                width: 16.w,
                height: 16.w,
                child: Image.asset(imageAsset),
              ),
              SizedBox(width: 8.w),
              Text(
                title,
                style: AppTextStyle.body2(
                  fontWeight: AppTextStyle.medium,
                  color: AppColor.Neutral900,
                ),
              ),
            ],
          ),
          Icon(Icons.arrow_forward_ios_rounded, size: 15.w),
        ],
      ),
    );
  }
}
