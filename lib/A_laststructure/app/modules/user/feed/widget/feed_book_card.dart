import 'package:baca_app/A_laststructure/app/core/color/app_color.dart';
import 'package:baca_app/A_laststructure/app/core/font/app_text_style.dart';
import 'package:baca_app/A_laststructure/app/data/model/book_model.dart';
import 'package:baca_app/A_laststructure/app/modules/user/feed/controllers/get_book_feed_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class FeedBookCard extends StatelessWidget {
  final void Function() ontap;
  final bool isSelected;

  final Book book;

  const FeedBookCard({
    super.key,
    required this.book,
    required this.ontap,
    required this.isSelected,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ontap,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: 172.w,
            height: 208.h,
            padding: EdgeInsets.symmetric(horizontal: 4.w, vertical: 4.h),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12.r),
              border: Border.all(
                color: isSelected ? AppColor.Primary500 : AppColor.Neutral300,
                width: isSelected ? 2.w : 1.w,
              ),
            ),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8.r),
                image: DecorationImage(
                  image: NetworkImage(book.coverUrl),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          SizedBox(height: 8.h),
          Row(
            children: [
              Expanded(
                child: Text(
                  book.title,
                  style: AppTextStyle.body2(fontWeight: AppTextStyle.bold),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ],
          ),
          SizedBox(height: 4.h),
          Text(
            book.author,
            style: AppTextStyle.body3(
              fontWeight: AppTextStyle.medium,
              color: AppColor.Neutral400,
            ),
          ),
        ],
      ),
    );
  }
}
