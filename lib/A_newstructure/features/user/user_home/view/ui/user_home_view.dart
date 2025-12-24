import 'package:baca_app/A_newstructure/constants/assets_constant.dart';
import 'package:baca_app/A_newstructure/features/user/user_home/controllers/user_home_controller.dart';
import 'package:baca_app/A_newstructure/features/user/user_home/view/components/user_home_body.dart';
import 'package:baca_app/A_newstructure/shared/controllers/get_all_book_controller.dart';
import 'package:baca_app/A_newstructure/shared/styles/app_color.dart';
import 'package:baca_app/A_newstructure/shared/widgets/user_bottom_nav.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class UserHomeView extends GetView<UserHomeController> {
  final bookController = Get.find<GetAllBookController>();
  UserHomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.Neutral100,
      appBar: AppBar(
        scrolledUnderElevation: 0,
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
                  image: AssetImage(Assets.Assets_logo),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ],
        ),
        actions: [
          GestureDetector(
            onTap: () => controller.toNotification(),
            child: Container(
              width: 20.w,
              height: 20.w,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(Assets.Icon_notification),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
        ],
      ),
      body: UserHomeBody(controller: controller),
      bottomNavigationBar: UserBottomNav(initialindex: 0),
    );
  }
}
