import 'package:baca_app/A_laststructure/app/core/color/app_color.dart';
import 'package:baca_app/A_laststructure/app/core/font/app_text_style.dart';
import 'package:baca_app/A_laststructure/app/data/model/book_model.dart';
import 'package:baca_app/A_laststructure/app/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class SearchBookCard extends StatelessWidget {
  final Book book;
  const SearchBookCard({super.key, required this.book});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Get.toNamed(Routes.DETAIL_BOOK, arguments: book),
      child: Container(
        margin: EdgeInsets.only(bottom: 12.h),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              width: 88.w,
              height: 118.h,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12.r),
                color: AppColor.Neutral100,
                border: Border.all(color: AppColor.Neutral300, width: 1.w),
              ),
              padding: EdgeInsets.symmetric(horizontal: 4.w, vertical: 4.h),
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
            SizedBox(width: 12.w),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    book.title,
                    style: AppTextStyle.body2(
                      fontWeight: AppTextStyle.bold,
                      color: AppColor.Neutral900,
                    ),
                    overflow: TextOverflow.ellipsis,
                  ),
                  SizedBox(height: 6.h),
                  Text(
                    book.author,
                    style: AppTextStyle.body2(
                      fontWeight: AppTextStyle.medium,
                      color: AppColor.Neutral400,
                    ),
                  ),
                  SizedBox(height: 12.h),
                  Row(
                    children: [
                      Icon(
                        Icons.star_rounded,
                        color: AppColor.Warning500,
                        size: 12.w,
                      ),
                      SizedBox(width: 4.w),
                      Text(
                        book.avgratings != 0.0
                            ? book.avgratings.toString()
                            : "Not reviewed",
                        style: AppTextStyle.body2(
                          fontWeight: AppTextStyle.medium,
                          color: AppColor.Neutral500,
                        ),
                      ),
                      SizedBox(width: 12.w),
                      Icon(Icons.circle, size: 4.w, color: AppColor.Neutral400),
                      SizedBox(width: 12.w),
                      Text(
                        "${book.stock} book available",
                        style: AppTextStyle.body3(
                          fontWeight: AppTextStyle.medium,
                          color: AppColor.Primary500,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
