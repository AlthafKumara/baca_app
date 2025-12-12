import 'package:baca_app/app/core/color/app_color.dart';
import 'package:baca_app/app/core/font/app_text_style.dart';
import 'package:baca_app/app/data/model/borrow_model.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AdminCardStatusContainer extends StatelessWidget {
  String status;
  Borrow borrow;
  AdminCardStatusContainer({
    super.key,
    required this.status,
    required this.borrow,
  });

  @override
  Widget build(BuildContext context) {
    final book = borrow.book;
    return Container(
      margin: EdgeInsets.only(bottom: 16.h),
      padding: EdgeInsets.symmetric(horizontal: 4.w, vertical: 4.h),
      decoration: BoxDecoration(
        border: Border.all(color: AppColor.Neutral300, width: 1.w),
        color: AppColor.Neutral100,
        borderRadius: BorderRadius.circular(16.r),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 353.w,
            height: 140.h,
            padding: EdgeInsets.only(top: 12.h),

            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12.r),
              color: AppColor.Neutral250,
            ),
            alignment: Alignment.center,
            child: Container(
              clipBehavior: Clip.none,
              width: 120.w,
              height: 177.h,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(12.r),
                  topRight: Radius.circular(12.r),
                ),
                image: DecorationImage(
                  image: NetworkImage(book!.coverUrl),
                  fit: BoxFit.fitWidth,
                ),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 12.h, horizontal: 12.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  book.title,
                  style: AppTextStyle.body1(
                    color: AppColor.Neutral900,
                    fontWeight: AppTextStyle.bold,
                  ),
                ),
                SizedBox(height: 6.h),
                Text(
                  book.author,
                  style: AppTextStyle.body2(
                    color: AppColor.Neutral400,
                    fontWeight: AppTextStyle.medium,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
