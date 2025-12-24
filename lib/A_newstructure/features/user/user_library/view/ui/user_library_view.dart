import 'package:baca_app/A_newstructure/configs/routes/route.dart';
import 'package:baca_app/A_newstructure/constants/assets_constant.dart';
import 'package:baca_app/A_newstructure/features/user/user_library/controllers/user_library_controller.dart';
import 'package:baca_app/A_newstructure/features/user/user_library/controllers/user_library_saved_list_controller.dart';
import 'package:baca_app/A_newstructure/features/user/user_library/view/components/on_borrow_container.dart';
import 'package:baca_app/A_newstructure/features/user/user_library/view/components/pending_container.dart';
import 'package:baca_app/A_newstructure/features/user/user_library/view/components/rejected_container.dart';
import 'package:baca_app/A_newstructure/features/user/user_library/view/components/returned_container.dart';
import 'package:baca_app/A_newstructure/features/user/user_library/view/components/savedListContainer.dart';
import 'package:baca_app/A_newstructure/shared/controllers/chip_controller.dart';
import 'package:baca_app/A_newstructure/shared/styles/app_color.dart';
import 'package:baca_app/A_newstructure/shared/styles/app_text_style.dart';
import 'package:baca_app/A_newstructure/shared/widgets/button_medium.dart';
import 'package:baca_app/A_newstructure/shared/widgets/chip.dart';
import 'package:baca_app/A_newstructure/shared/widgets/user_bottom_nav.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class UserLibraryView extends GetView<UserLibraryController> {
  final chipcontroller = Get.find<ChipController>();
  final savedController = Get.find<UserLibrarySavedListController>();
  UserLibraryView({super.key});

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
                    controller.tosearch();
                  },
                  child: SizedBox(
                    width: 24.w,
                    height: 24.w,
                    child: Image.asset(Assets.Icon_search),
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
                          Get.toNamed(Routes.USER_CREATE_SAVED_LIST);
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

      bottomNavigationBar: UserBottomNav(initialindex: 2),
    );
  }
}
