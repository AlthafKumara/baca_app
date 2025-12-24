import 'package:baca_app/A_newstructure/features/admin/admin_borrow_detail/view/components/body_onborrow.dart';
import 'package:baca_app/A_newstructure/features/admin/admin_borrow_detail/view/components/body_pending.dart';
import 'package:baca_app/A_newstructure/features/admin/admin_borrow_detail/view/components/body_returned.dart';
import 'package:baca_app/A_newstructure/features/admin/admin_borrow_detail/view/components/bottom_nav_borrow.dart';
import 'package:baca_app/A_newstructure/features/admin/admin_borrow_detail/view/components/bottom_nav_pending.dart';
import 'package:baca_app/A_newstructure/shared/models/borrow_model.dart';
import 'package:baca_app/A_newstructure/shared/styles/app_color.dart';
import 'package:baca_app/A_newstructure/shared/styles/app_text_style.dart';
import 'package:baca_app/A_newstructure/utils/enums/status_enum.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class AdminBorrowDetailView extends StatelessWidget {
  const AdminBorrowDetailView({super.key});

  String statusText(Status status) {
    switch (status) {
      case Status.pending:
        return "Pending";
      case Status.onBorrow:
        return "On Borrow";
      case Status.returned:
        return "Returned";
      case Status.rejected:
        return "Rejected";
    }
  }

  @override
  Widget build(BuildContext context) {
    final args = Get.arguments;

    final Status status = args['status'] as Status;
    final BorrowModel borrow = args['borrow'] as BorrowModel;

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
              statusText(status), 
              style: AppTextStyle.body2(
                color: AppColor.Neutral100,
                fontWeight: AppTextStyle.medium,
              ),
            ),
          ),
          SizedBox(height: 24.h),
          status == Status.pending
              ? BodyPending(status: status, borrow: borrow)
              : status == Status.onBorrow
              ? BodyOnborrow(status: status, borrow: borrow)
              : status == Status.returned
              ? BodyReturned(status: status, borrow: borrow)
              : Container(),
        ],
      ),
      bottomNavigationBar: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 22.h),
        child: status == Status.pending
            ? BottomNavPending(borrowId: borrow.id)
            : status == Status.onBorrow
            ? BottomNavBorrow(borrowId: borrow.id)
            : SizedBox(),
      ),
    );
  }
}
