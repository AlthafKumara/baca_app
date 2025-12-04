import 'package:baca_app/app/core/color/app_color.dart';
import 'package:baca_app/app/core/font/app_text_style.dart';
import 'package:baca_app/app/core/widget/admin_bottom_nav.dart';
import 'package:baca_app/app/core/widget/button_medium.dart';
import 'package:baca_app/app/modules/admin/admin_library/controllers/tab_page_controller.dart';
import 'package:baca_app/app/modules/admin/admin_library/widget/book_tab.dart';
import 'package:baca_app/app/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';

import '../controllers/admin_library_controller.dart';

class AdminLibraryView extends GetView<AdminLibraryController> {
  AdminLibraryView({super.key});
  @override
  Widget build(BuildContext context) {
    final tabController = Get.find<TabPageController>();
    return Scaffold(
      backgroundColor: AppColor.Neutral100,
      appBar: AppBar(
        backgroundColor: AppColor.Neutral100,
        actions: [
          GestureDetector(
            child: SizedBox(
              height: 24.w,
              width: 24.w,
              child: Image.asset("assets/appbar/search.png"),
            ),
          ),
          SizedBox(width: 16.w),
          CustomButtonMedium.primaryMedium(
            isLoading: false,
            onPressed: () {
              Get.toNamed(Routes.ADMIN_FORMBOOK);
            },
            text: "Add Book",
            prefixicon: SizedBox(
              width: 20.w,
              height: 20.w,
              child: Image.asset("assets/appbar/add.png"),
            ),
          ),
          SizedBox(width: 16.w),
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
      ),
      body: TabBarView(
        controller: tabController.tabController,
        children: [
          BookTab(),
          Center(child: Text('Transaction')),
        ],
      ),
      bottomNavigationBar: AdminCustomBottomNav(initialIndex: 1),
    );
  }
}
