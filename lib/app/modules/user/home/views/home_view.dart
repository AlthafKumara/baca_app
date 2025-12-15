import 'package:baca_app/app/core/color/app_color.dart';
import 'package:baca_app/app/core/constant/asset_constant.dart';
import 'package:baca_app/app/core/font/app_text_style.dart';
import 'package:baca_app/app/core/widget/bottom_nav.dart';
import 'package:baca_app/app/core/widget/textfield.dart';
import 'package:baca_app/app/data/model/book_model.dart';
import 'package:baca_app/app/modules/user/home/controllers/book_controller.dart';

import 'package:baca_app/app/modules/user/home/controllers/bottomnav_controller.dart';
import 'package:baca_app/app/modules/user/home/controllers/home_controller.dart';
import 'package:baca_app/app/modules/user/home/widget/book_card.dart';
import 'package:baca_app/app/modules/user/home/widget/home_body.dart';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});
  @override
  Widget build(BuildContext context) {
    final controller = Get.find<HomeController>();
    final bookController = Get.find<BookController>();
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
          Container(
            width: 20.w,
            height: 20.w,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(Assets.Assets_appbar_notification),
                fit: BoxFit.cover,
              ),
            ),
          ),
        ],
      ),
      body: HomeBody(),
      bottomNavigationBar: CustomBottomNav(initialindex: 0),
    );
  }
}
