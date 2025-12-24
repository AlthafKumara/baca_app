import 'package:baca_app/A_newstructure/configs/routes/route.dart';
import 'package:baca_app/A_newstructure/constants/assets_constant.dart';
import 'package:baca_app/A_newstructure/features/admin/admin_library/controllers/admin_card_controller.dart';
import 'package:baca_app/A_newstructure/features/admin/admin_library/controllers/admin_library_controller.dart';
import 'package:baca_app/A_newstructure/features/admin/admin_library/controllers/admin_tab_page_controller.dart';
import 'package:baca_app/A_newstructure/features/admin/admin_library/view/components/book_tab.dart';
import 'package:baca_app/A_newstructure/features/admin/admin_library/view/components/transaction_tab.dart';
import 'package:baca_app/A_newstructure/shared/controllers/delete_book_controller.dart';
import 'package:baca_app/A_newstructure/shared/styles/app_color.dart';
import 'package:baca_app/A_newstructure/shared/styles/app_text_style.dart';
import 'package:baca_app/A_newstructure/shared/widgets/admin_bottom_nav.dart';
import 'package:baca_app/A_newstructure/shared/widgets/bottom_sheet.dart';
import 'package:baca_app/A_newstructure/shared/widgets/button_medium.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class AdminLibraryView extends GetView<AdminLibraryController> {
  final cardController = Get.find<AdminCardController>();
  final deleteBookC = Get.find<DeleteBookController>();
  AdminLibraryView({super.key});
  @override
  Widget build(BuildContext context) {
    final tabController = Get.find<AdminTabPageController>();

    return Scaffold(
      backgroundColor: AppColor.Neutral100,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(100.h),
        child: Obx(() {
          final selectedMode = cardController.selectedMode.value;
          final index = tabController.currentindex.value;
          return AppBar(
            backgroundColor: AppColor.Neutral100,
            actions: [
              index == 0
                  ? Row(
                      children: [
                        GestureDetector(
                          onTap: () => Get.toNamed(Routes.ADMIN_SEARCH),
                          child: SizedBox(
                            height: 24.w,
                            width: 24.w,
                            child: Image.asset(Assets.Icon_search),
                          ),
                        ),
                        SizedBox(width: 16.w),
                        CustomButtonMedium.primaryMedium(
                          color: selectedMode
                              ? AppColor.Danger600
                              : AppColor.Primary500,
                          isLoading: false,
                          onPressed: () {
                            if (selectedMode == false) {
                              Get.toNamed(Routes.ADMIN_FORMBOOK);
                            }
                            if (selectedMode == true) {
                              cardController.selectedList.isNotEmpty
                                  ? CustomBottomSheet.doubleBottomSheet(
                                      height: 375,
                                      image: Assets.Ilustration_delete,
                                      message:
                                          "Are you sure want to delete ${cardController.selectedList.length} selected book ? You will not be able to maintain this book",
                                      primarybuttonText: "Delete",
                                      secondarybuttonText: "Cancel",
                                      onPressed: () {
                                        print(cardController.getSelectedIds());
                                        deleteBookC.deleteSelectBooks(
                                          cardController.getSelectedIds(),
                                        );
                                        Get.back();
                                        cardController.selectedMode.value =
                                            false;
                                        cardController.selectedList.clear();
                                      },
                                      title: "Delete Book",
                                    )
                                  : null;
                            }
                          },
                          text: selectedMode ? "Delete" : "Add Book",
                          prefixicon: SizedBox(
                            width: 20.w,
                            height: 20.w,
                            child: selectedMode
                                ? Image.asset(Assets.Icon_delete)
                                : Icon(Icons.add, color: Colors.white),
                          ),
                        ),
                        SizedBox(width: 16.w),
                      ],
                    )
                  : index == 1
                  ? Row(
                      children: [
                        GestureDetector(
                          onTap: () {
                            Get.toNamed(Routes.ADMIN_SCAN);
                          },
                          child: SizedBox(
                            width: 24.w,
                            height: 24.w,
                            child: Image.asset(Assets.Icon_scan),
                          ),
                        ),
                        SizedBox(width: 16.w),
                      ],
                    )
                  : Container(),
            ],

            title: Text(
              'Library',
              style: AppTextStyle.heading3(
                fontWeight: AppTextStyle.bold,
                color: AppColor.Neutral900,
              ),
            ),

            bottom: TabBar(
              dividerColor: AppColor.Primary500,
              indicatorColor: AppColor.Primary500,
              indicatorSize: TabBarIndicatorSize.tab,
              labelStyle: AppTextStyle.body3(
                fontWeight: AppTextStyle.bold,
                color: AppColor.Primary500,
              ),
              indicatorAnimation: TabIndicatorAnimation.linear,
              isScrollable: false,
              unselectedLabelColor: AppColor.Neutral400,

              controller: tabController.tabController,
              tabs: [
                Tab(child: Text('Books')),
                Tab(child: Text('Transaction')),
              ],
            ),
          );
        }),
      ),
      body: TabBarView(
        controller: tabController.tabController,
        children: [BookTab(), TransactionTab()],
      ),
      floatingActionButton: Obx(() {
        return cardController.selectedMode.value
            ? FloatingActionButton(
                backgroundColor: AppColor.Primary500,
                onPressed: () {
                  cardController.selectedMode.value =
                      !cardController.selectedMode.value;
                  cardController.selectedList.clear();
                },

                child: Icon(
                  Icons.close,
                  color: AppColor.Neutral100,
                  size: 24.sp,
                ),
              )
            : SizedBox();
      }),
      bottomNavigationBar: AdminCustomBottomNav(initialIndex: 1),
    );
  }
}
