import 'package:baca_app/app/core/widget/chip.dart';
import 'package:baca_app/app/modules/admin/admin_library/controllers/chip_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class BookTab extends StatelessWidget {
  final chipcontroller = Get.find<ChipController>();
  BookTab({super.key});

  @override
  Widget build(BuildContext context) {
    List<String> chipsLabel = ["All Book", "Book Available", "On Borrow"];
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
                    chipsLabel.length,
                    (index) => CustomChip().filterChip(
                      onTap: () => chipcontroller.onpress(index),

                      title: chipsLabel[index],
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
        ],
      ),
    );
  }
}
