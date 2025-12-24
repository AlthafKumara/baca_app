import 'package:baca_app/A_newstructure/constants/assets_constant.dart';
import 'package:baca_app/A_newstructure/features/admin/admin_library/view/components/transaction_all.dart';
import 'package:baca_app/A_newstructure/features/admin/admin_library/view/components/transaction_borrow.dart';
import 'package:baca_app/A_newstructure/features/admin/admin_library/view/components/transaction_returned.dart';
import 'package:baca_app/A_newstructure/shared/controllers/chip_controller.dart';
import 'package:baca_app/A_newstructure/shared/widgets/chip.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class TransactionTab extends StatelessWidget {
  final chipcontroller = Get.find<ChipController>();
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
      child: Column(
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
                  child: Image.asset(Assets.Icon_filter),
                ),
              ),
            ],
          ),
          SizedBox(height: 13.h),
          Obx(
            () => chipcontroller.selectedIndex.value == 0
                ? Expanded(child: TransactionAll())
                : chipcontroller.selectedIndex.value == 1
                ? Expanded(child: TransactionBorrow())
                : chipcontroller.selectedIndex.value == 2
                ? Expanded(child: TransactionReturned())
                : SizedBox(),
          ),
        ],
      ),
    );
  }
}
