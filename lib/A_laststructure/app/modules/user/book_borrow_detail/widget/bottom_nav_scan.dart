import 'package:baca_app/A_laststructure/app/core/color/app_color.dart';
import 'package:baca_app/A_laststructure/app/core/font/app_text_style.dart';
import 'package:baca_app/A_laststructure/app/core/widget/bottom_sheet.dart';
import 'package:baca_app/A_laststructure/app/core/widget/button_large.dart';
import 'package:baca_app/A_laststructure/app/core/widget/qr_code.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class BottomNavScan extends StatelessWidget {
  String qrText;
  BottomNavScan({super.key, required this.qrText});

  @override
  Widget build(BuildContext context) {
    return CustomButtonLarge.primarylarge(
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
                  border: Border.all(color: AppColor.Primary500, width: 2.w),
                ),
                child: CustomQrCode.generateQrCode(qrText: qrText),
              ),
              SizedBox(height: 16.h),
              Container(
                width: double.infinity,
                padding: EdgeInsets.symmetric(horizontal: 14.w, vertical: 14.h),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12.r),
                  color: AppColor.Neutral250,
                ),

                child: Row(
                  children: [
                    Icon(Icons.info, color: AppColor.Primary500, size: 20.w),
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
    );
  }
}
