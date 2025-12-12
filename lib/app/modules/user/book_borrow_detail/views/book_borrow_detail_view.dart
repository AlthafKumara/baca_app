import 'package:baca_app/app/core/color/app_color.dart';
import 'package:baca_app/app/core/font/app_text_style.dart';
import 'package:baca_app/app/core/widget/qr_code.dart';
import 'package:baca_app/app/core/widget/bottom_sheet.dart';
import 'package:baca_app/app/core/widget/button_large.dart';
import 'package:baca_app/app/data/model/borrow_model.dart';
import 'package:baca_app/app/modules/user/book_borrow_detail/widget/bottom_nav_review.dart';
import 'package:baca_app/app/modules/user/book_borrow_detail/widget/bottom_nav_scan.dart';
import 'package:baca_app/app/modules/user/book_borrow_detail/widget/card_status_container.dart';
import 'package:baca_app/app/modules/user/book_borrow_detail/widget/user_body_onborrow.dart';
import 'package:baca_app/app/modules/user/book_borrow_detail/widget/user_body_pending.dart';
import 'package:baca_app/app/modules/user/book_borrow_detail/widget/user_body_returned.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';

import '../controllers/book_borrow_detail_controller.dart';

class BookBorrowDetailView extends GetView<BookBorrowDetailController> {
  BookBorrowDetailView({super.key});

  @override
  Widget build(BuildContext context) {
    final arguments = Get.arguments;
    final borrow = arguments["borrow"] as Borrow;
    final status = arguments["status"] as Status;
    final raw = borrow.status.toString().split('.').last.toUpperCase();

    final statusName = raw[0].toUpperCase() + raw.substring(1).toLowerCase();
    return Scaffold(
      backgroundColor: AppColor.Neutral100,
      appBar: AppBar(
        backgroundColor: AppColor.Neutral100,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_rounded,
            color: AppColor.Neutral900,
            size: 24.w,
          ),
          onPressed: () => Get.back(),
        ),
      ),
      body: Column(
        children: [
          Container(
            alignment: Alignment.center,
            padding: EdgeInsets.symmetric(vertical: 16.h),
            color: status == Status.returned
                ? AppColor.Success600
                : status == Status.pending
                ? AppColor.Warning600
                : status == Status.onBorrow
                ? AppColor.Primary600
                : status == Status.rejected
                ? AppColor.Danger600
                : null,
            child: Text(
              statusName,
              style: AppTextStyle.body2(
                color: AppColor.Neutral100,
                fontWeight: AppTextStyle.medium,
              ),
            ),
          ),
          SizedBox(height: 24.h),
          status == Status.pending
              ? UserBodyPending(borrow: borrow, status: status)
              : status == Status.onBorrow
              ? UserBodyOnborrow(status: status, borrow: borrow)
              : status == Status.returned
              ? UserBodyReturned(status: status, borrow: borrow)
              : status == Status.rejected
              ? UserBodyReturned(status: status, borrow: borrow)
              : Container(),
        ],
      ),
      bottomNavigationBar: Padding(
        padding: EdgeInsetsGeometry.symmetric(horizontal: 16.w, vertical: 20.h),
        child: status == Status.pending || status == Status.onBorrow
            ? BottomNavScan(qrText: borrow.qrText)
            : status == Status.returned
            ? borrow.isReviewed == false
                  ? BottomNavReview(borrow: borrow)
                  : null
            : null,
      ),
    );
  }
}
