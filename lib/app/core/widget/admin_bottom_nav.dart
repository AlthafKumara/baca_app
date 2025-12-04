import 'package:baca_app/app/core/color/app_color.dart';
import 'package:baca_app/app/core/font/app_text_style.dart';
import 'package:baca_app/app/modules/admin/admin_home/controllers/admin_bottomnav_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class AdminCustomBottomNav extends StatelessWidget {
  final int initialIndex;
  final controller = Get.put(AdminBottomnavController());
  AdminCustomBottomNav({Key? key, required this.initialIndex})
    : super(key: key) {
    controller.selectedIndex.value = initialIndex;
  }

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: Theme.of(context).copyWith(
        splashColor: Colors.transparent,
        highlightColor: Colors.transparent,
      ),
      child: Obx(
        () => BottomNavigationBar(
          enableFeedback: false,
          type: BottomNavigationBarType.fixed,
          currentIndex: controller.selectedIndex.value,
          onTap: controller.changeIndex,
          backgroundColor: AppColor.Neutral100,
          elevation: 1,
          showSelectedLabels: true,
          showUnselectedLabels: true,
          selectedLabelStyle: AppTextStyle.body3(fontWeight: AppTextStyle.bold),
          unselectedLabelStyle: AppTextStyle.body3(
            fontWeight: AppTextStyle.medium,
          ),
          selectedItemColor: AppColor.Primary500,
          unselectedItemColor: AppColor.Neutral400,

          items: [
            BottomNavigationBarItem(
              icon: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(
                    width: 20.w,
                    height: 20.w,
                    child: Image.asset("assets/bottomnav/book_inactive.png"),
                  ),
                  SizedBox(height: 6.h),
                ],
              ),
              activeIcon: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(
                    width: 20.w,
                    height: 20.w,
                    child: Image.asset("assets/bottomnav/book_active.png"),
                  ),
                  SizedBox(height: 6.h),
                ],
              ),
              label: "Home",
            ),

            BottomNavigationBarItem(
              icon: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(
                    width: 20.w,
                    height: 20.w,
                    child: Image.asset("assets/bottomnav/library_inactive.png"),
                  ),
                  SizedBox(height: 6.h),
                ],
              ),
              activeIcon: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(
                    width: 20.w,
                    height: 20.w,
                    child: Image.asset("assets/bottomnav/library_active.png"),
                  ),
                  SizedBox(height: 6.h),
                ],
              ),
              label: "Library",
            ),
            BottomNavigationBarItem(
              icon: Column(
                children: [
                  SizedBox(
                    width: 20.w,
                    height: 20.w,
                    child: Image.asset("assets/bottomnav/profile_inactive.png"),
                  ),
                  SizedBox(height: 6.h),
                ],
              ),
              activeIcon: Column(
                children: [
                  SizedBox(
                    width: 20.w,
                    height: 20.w,
                    child: Image.asset("assets/bottomnav/profile_active.png"),
                  ),
                  SizedBox(height: 6.h),
                ],
              ),
              label: "Profile",
            ),
          ],
        ),
      ),
    );
  }
}
