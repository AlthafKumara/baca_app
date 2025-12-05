import 'package:baca_app/app/core/color/app_color.dart';
import 'package:baca_app/app/core/font/app_text_style.dart';
import 'package:baca_app/app/core/widget/chip.dart';
import 'package:baca_app/app/modules/admin/admin_library/controllers/book_controller.dart';
import 'package:baca_app/app/modules/admin/admin_library/controllers/chip_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class TransactionTab extends StatelessWidget {
  final chipcontroller = Get.find<ChipController>();
  final bookcontroller = Get.find<BookController>();
  TransactionTab({super.key});

  @override
  Widget build(BuildContext context) {
    List<String> chipsLabelTransaction = [
      "All Transaction",
      "On Borrow",
      "Returned",
    ];
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 14.h),
      child: ListView(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Obx(() {
                return Wrap(
                  spacing: 8.w,
                  children: List<Widget>.generate(
                    chipsLabelTransaction.length,
                    (index) => CustomChip().filterChip(
                      onTap: () => chipcontroller.onpress(index),

                      title: chipsLabelTransaction[index],
                      selected: chipcontroller.selectedIndex.value == index,
                    ),
                  ),
                );
              }),
              GestureDetector(
                onTap: () {},
                child: SizedBox(
                  width: 24.w,
                  height: 24.w,
                  child: Image.asset("assets/library/filter.png"),
                ),
              ),
            ],
          ),
          SizedBox(height: 13.h),
          SizedBox(
            height: 630.h,
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    width: 160.w,
                    height: 160.w,
                    child: Image.asset("assets/library/ilustration.png"),
                  ),
                  SizedBox(height: 20.h),
                  Text(
                    "No book found",
                    style: AppTextStyle.heading5(
                      fontWeight: AppTextStyle.medium,
                      color: AppColor.Neutral900,
                    ),
                  ),
                  SizedBox(height: 8.h),
                  Text(
                    "Book data in this category is empty",
                    style: AppTextStyle.description2(
                      fontWeight: AppTextStyle.medium,
                      color: AppColor.Neutral400,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
