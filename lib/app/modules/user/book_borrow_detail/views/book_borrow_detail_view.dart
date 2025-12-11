import 'package:baca_app/app/core/color/app_color.dart';
import 'package:baca_app/app/core/font/app_text_style.dart';
import 'package:baca_app/app/core/widget/qr_code.dart';
import 'package:baca_app/app/core/widget/bottom_sheet.dart';
import 'package:baca_app/app/core/widget/button_large.dart';
import 'package:baca_app/app/data/model/borrow_model.dart';
import 'package:baca_app/app/modules/user/book_borrow_detail/widget/card_status_container.dart';
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
    final status = arguments["status"];
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
              ? CardStatusContainer(status: status, borrow: borrow)
              : Container(),
        ],
      ),
      bottomNavigationBar: Padding(
        padding: EdgeInsetsGeometry.symmetric(horizontal: 16.w, vertical: 20.h),
        child: CustomButtonLarge.primarylarge(
          onPressed: () {
            CustomBottomSheet.singleBottomSheetWidget(
              height: 520,
              buttonText: "Close",
              onPressed: () => Get.back(),
              child: Column(
                children: [
                  Container(
                    alignment: Alignment.center,
                    padding: EdgeInsets.symmetric(vertical: 16.h),
                    width: double.infinity,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(24.r),
                      border: Border.all(
                        color: AppColor.Primary500,
                        width: 2.w,
                      ),
                    ),
                    child: CustomQrCode.generateQrCode(qrText: borrow.qrText),
                  ),
                  SizedBox(height: 16.h),
                  Container(
                    width: double.infinity,
                    padding: EdgeInsets.symmetric(
                      horizontal: 14.w,
                      vertical: 14.h,
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12.r),
                      color: AppColor.Neutral250,
                    ),

                    child: Row(
                      children: [
                        Icon(
                          Icons.info,
                          color: AppColor.Primary500,
                          size: 20.w,
                        ),
                        SizedBox(width: 12.w),
                        Expanded(
                          child: Text(
                            "Please show this QR to the librarian to update status of this book.",
                            style: AppTextStyle.body3(
                              color: AppColor.Neutral500,
                              fontWeight: AppTextStyle.regular,
                            ),
                            maxLines: 2,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            );
          },
          text: "Show QR",
        ),
      ),
    );
  }
}
