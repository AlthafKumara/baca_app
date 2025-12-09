import 'package:baca_app/app/core/color/app_color.dart';
import 'package:baca_app/app/core/font/app_text_style.dart';
import 'package:baca_app/app/core/widget/bottom_nav.dart';
import 'package:baca_app/app/core/widget/chip.dart';

import 'package:baca_app/app/modules/user/home/controllers/bottomnav_controller.dart';
import 'package:baca_app/app/modules/user/library/controllers/chip_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';

import '../controllers/library_controller.dart';

class LibraryView extends StatelessWidget {
  final controller = Get.find<LibraryController>();
  final chipcontroller = Get.find<ChipController>();
  LibraryView({super.key});
  @override
  Widget build(BuildContext context) {
    List<String> chipsLabel = ["Saved List", "On Borrow", "Returned"];
    return Scaffold(
      backgroundColor: AppColor.Neutral100,
      appBar: AppBar(
        backgroundColor: AppColor.Neutral100,
        title: Text(
          'Library',
          style: AppTextStyle.heading3(
            color: AppColor.Neutral900,
            fontWeight: AppTextStyle.bold,
          ),
        ),
        actionsPadding: EdgeInsets.symmetric(horizontal: 16.w),
        actions: [
          GestureDetector(
            onTap: () {},
            child: SizedBox(
              width: 24.w,
              height: 24.w,
              child: Image.asset("assets/appbar/search.png"),
            ),
          ),
        ],
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(vertical: 8.h, horizontal: 16.w),
        child: Column(
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
              ],
            ),
          ],
        ),
      ),
      bottomNavigationBar: CustomBottomNav(initialindex: 2),
    );
  }
}
