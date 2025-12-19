import 'package:baca_app/A_laststructure/app/core/color/app_color.dart';
import 'package:baca_app/A_laststructure/app/core/font/app_text_style.dart';
import 'package:baca_app/A_laststructure/app/data/model/borrow_model.dart';
import 'package:baca_app/A_laststructure/app/modules/admin/admin_book_borrow_detail/widget/admin_card_status_container.dart';
import 'package:baca_app/A_laststructure/app/modules/admin/admin_book_borrow_detail/widget/body_onborrow.dart';
import 'package:baca_app/A_laststructure/app/modules/admin/admin_book_borrow_detail/widget/body_pending.dart';
import 'package:baca_app/A_laststructure/app/modules/admin/admin_book_borrow_detail/widget/body_returned.dart';
import 'package:baca_app/A_laststructure/app/modules/admin/admin_book_borrow_detail/widget/bottom_nav_borrow.dart';
import 'package:baca_app/A_laststructure/app/modules/admin/admin_book_borrow_detail/widget/bottom_nav_pending.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';

import '../controllers/admin_book_borrow_detail_controller.dart';

class AdminBookBorrowDetailView
    extends GetView<AdminBookBorrowDetailController> {
  const AdminBookBorrowDetailView({super.key});
  @override
  Widget build(BuildContext context) {
    final args = Get.arguments;

    final status = args['status'];
    final borrow = args['borrow'] as Borrow;
    return Scaffold(
      backgroundColor: AppColor.Neutral100,
      appBar: AppBar(
        backgroundColor: AppColor.Neutral100,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_rounded, color: Colors.black, size: 24.w),
          onPressed: () => Get.back(),
        ),
      ),
      body: Column(
        children: [
          Column(
            children: [
              Container(
                alignment: Alignment.center,
                padding: EdgeInsets.symmetric(vertical: 16.h),
                color: status == "Returned"
                    ? AppColor.Success600
                    : status == "Pending"
                    ? AppColor.Warning600
                    : status == "On Borrow"
                    ? AppColor.Primary600
                    : status == "Rejected"
                    ? AppColor.Danger600
                    : null,
                child: Text(
                  status,
                  style: AppTextStyle.body2(
                    color: AppColor.Neutral100,
                    fontWeight: AppTextStyle.medium,
                  ),
                ),
              ),
              SizedBox(height: 24.h),
              status == "Pending"
                  ? BodyPending(status: status, borrow: borrow)
                  : status == "On Borrow"
                  ? BodyOnborrow(status: status, borrow: borrow)
                  : status == "Returned"
                  ? BodyReturned(status: status, borrow: borrow)
                  : Container(),
            ],
          ),
        ],
      ),

      bottomNavigationBar: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 22.h),
        child: status == "Pending"
            ? BottomNavPending(borrowId: borrow.id)
            : status == "On Borrow"
            ? BottomNavBorrow(borrowId: borrow.id)
            : SizedBox(),
      ),
    );
  }
}
