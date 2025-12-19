import 'dart:math';

import 'package:baca_app/A_laststructure/app/core/color/app_color.dart';
import 'package:baca_app/A_laststructure/app/core/font/app_text_style.dart';
import 'package:baca_app/A_laststructure/app/data/model/borrow_model.dart';
import 'package:baca_app/A_laststructure/app/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class BookBorrowCard extends StatelessWidget {
  final Borrow borrow;

  const BookBorrowCard({super.key, required this.borrow});

  @override
  Widget build(BuildContext context) {
    final book = borrow.book;

    // Tentukan status per item, bukan seluruh list
    String status = switch (borrow.status) {
      Status.pending => "Pending",
      Status.onBorrow => "On Borrow",
      Status.returned => "Returned",
      Status.rejected => "Rejected",
    };

    return GestureDetector(
      onTap: () {
        Get.toNamed(
          Routes.ADMIN_BOOK_BORROW_DETAIL,
          arguments: {"borrow": borrow, "status": status},
        );
      },
      child: Container(
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
                  SizedBox(height: 12.h),
                  Row(
                    children: [
                      Icon(
                        Icons.circle,
                        color: status == "Returned"
                            ? AppColor.Success600
                            : status == "Pending"
                            ? AppColor.Warning600
                            : status == "On Borrow"
                            ? AppColor.Primary600
                            : status == "Rejected"
                            ? AppColor.Danger600
                            : null,
                        size: 6.w,
                      ),
                      SizedBox(width: 6.w),
                      Text(
                        status,
                        style: AppTextStyle.body3(
                          color: status == "Returned"
                              ? AppColor.Success600
                              : status == "Pending"
                              ? AppColor.Warning600
                              : status == "On Borrow"
                              ? AppColor.Primary600
                              : status == "Rejected"
                              ? AppColor.Danger600
                              : null,
                          fontWeight: AppTextStyle.medium,
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
