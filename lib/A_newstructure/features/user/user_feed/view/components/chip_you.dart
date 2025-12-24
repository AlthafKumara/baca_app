import 'package:baca_app/A_newstructure/shared/styles/app_color.dart';
import 'package:baca_app/A_newstructure/shared/styles/app_text_style.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ChipYou extends StatelessWidget {
  const ChipYou({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColor.Primary500,
        borderRadius: BorderRadius.circular(999.r),
        shape: BoxShape.rectangle,
      ),
      padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 2.h),
      child: Text(
        "You",
        style: AppTextStyle.body3(
          color: AppColor.Neutral100,
          fontWeight: AppTextStyle.medium,
        ),
      ),
    );
  }
}
