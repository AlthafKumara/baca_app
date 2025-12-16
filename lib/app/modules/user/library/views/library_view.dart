import 'package:baca_app/app/core/color/app_color.dart';
import 'package:baca_app/app/core/constant/asset_constant.dart';
import 'package:baca_app/app/core/font/app_text_style.dart';
import 'package:baca_app/app/core/widget/bottom_nav.dart';
import 'package:baca_app/app/core/widget/button_medium.dart';
import 'package:baca_app/app/core/widget/chip.dart';

import 'package:baca_app/app/modules/user/home/controllers/bottomnav_controller.dart';
import 'package:baca_app/app/modules/user/library/controllers/chip_controller.dart';
import 'package:baca_app/app/modules/user/library/controllers/saved_list_controller.dart';
import 'package:baca_app/app/modules/user/library/widget/on_borrow_container.dart';
import 'package:baca_app/app/modules/user/library/widget/pending_container.dart';
import 'package:baca_app/app/modules/user/library/widget/rejected_container.dart';
import 'package:baca_app/app/modules/user/library/widget/returned_container.dart';
import 'package:baca_app/app/modules/user/library/widget/saved_list_container.dart';
import 'package:baca_app/app/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';

import '../controllers/library_controller.dart';

class LibraryView extends StatelessWidget {
  final controller = Get.find<LibraryController>();
  final chipcontroller = Get.find<ChipController>();
  final savedController = Get.find<SavedListController>();
  LibraryView({super.key});
  @override
  Widget build(BuildContext context) {
    List<String> chipsLabel = [
      "Saved List",
      "Pending",
      "On Borrow",
      "Returned",
      "Rejected",
    ];
    return Scaffold(
      backgroundColor: AppColor.Neutral100,
      appBar: AppBar(
        scrolledUnderElevation: 0,
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
          Obx(() {
            return Row(
              children: [
                GestureDetector(
                  onTap: () {
                    Get.toNamed(Routes.SEARCH);
                  },
                  child: SizedBox(
                    width: 24.w,
                    height: 24.w,
                    child: Image.asset(Assets.Assets_appbar_search),
                  ),
                ),

                if (chipcontroller.selectedIndex.value == 0)
                  Row(
                    children: [
                      SizedBox(width: 20.w),
                      CustomButtonMedium.primaryMedium(
                        color: AppColor.Primary500,
                        text: "Add",
                        prefixicon: Icon(
                          Icons.add,
                          color: Colors.white,
                          size: 20.w,
                        ),
                        isLoading: false,
                        onPressed: () {
                          Get.toNamed(Routes.CREATE_SAVED_LIST);
                        },
                      ),
                    ],
                  ),
              ],
            );
          }),
        ],
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(vertical: 8.h, horizontal: 16.w),
        child: Column(
          children: [
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
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
            ),
            SizedBox(height: 16.h),

            Obx(
              () => chipcontroller.selectedIndex.value == 0
                  ? Expanded(child: SavedListContainer())
                  : chipcontroller.selectedIndex.value == 1
                  ? Expanded(child: PendingContainer())
                  : chipcontroller.selectedIndex.value == 2
                  ? Expanded(child: OnBorrowContainer())
                  : chipcontroller.selectedIndex.value == 3
                  ? Expanded(child: ReturnedContainer())
                  : chipcontroller.selectedIndex.value == 4
                  ? Expanded(child: RejectedContainer())
                  : SizedBox(),
            ),
          ],
        ),
      ),

      floatingActionButton: Obx(() {
        if (savedController.selectedItemId.value != null &&
            chipcontroller.selectedIndex.value == 0) {
          return FloatingActionButton(
            backgroundColor: AppColor.Danger600,
            onPressed: () {
              savedController.handleDeleteSavedList(
                listId: savedController.selectedItemId.value!,
              );
            },
            child: Icon(Icons.delete, color: Colors.white),
          );
        }
        return SizedBox.shrink();
      }),

      bottomNavigationBar: CustomBottomNav(initialindex: 2),
    );
  }
}
