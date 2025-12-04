import 'package:baca_app/app/core/color/app_color.dart';
import 'package:baca_app/app/core/widget/bottom_nav.dart';

import 'package:baca_app/app/modules/user/home/controllers/bottomnav_controller.dart';
import 'package:baca_app/app/modules/user/home/controllers/home_controller.dart';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';

class HomeView extends GetView<BottomnavController> {
  const HomeView({super.key});
  @override
  Widget build(BuildContext context) {
    final controller = Get.find<HomeController>();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColor.Neutral100,
        actionsPadding: EdgeInsets.only(right: 16.w),
        leading: Row(
          children: [
            SizedBox(width: 16.w),
            Container(
              width: 26.w,
              height: 26.w,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("assets/Logo.png"),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ],
        ),
        actions: [
          Container(
            width: 20.w,
            height: 20.w,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/appbar/notification.png"),
                fit: BoxFit.cover,
              ),
            ),
          ),
        ],
      ),
      body: Obx(() {
        final user = controller.profile.value;

        if (user == null) {
          return Center(child: CircularProgressIndicator());
        }
        return Center(
          child: Text('${user.email}', style: TextStyle(fontSize: 20)),
        );
      }),

      bottomNavigationBar: CustomBottomNav(initialindex: 0),
    );
  }
}
