import 'package:baca_app/app/core/color/app_color.dart';
import 'package:baca_app/app/core/constant/asset_constant.dart';
import 'package:baca_app/app/core/font/app_text_style.dart';
import 'package:baca_app/app/core/widget/bottom_nav.dart';
import 'package:baca_app/app/core/widget/button_medium.dart';
import 'package:baca_app/app/core/widget/textfield.dart';
import 'package:baca_app/app/modules/user/home/controllers/bottomnav_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';

import '../controllers/feed_controller.dart';

class FeedView extends StatelessWidget {
  const FeedView({super.key});
  @override
  Widget build(BuildContext context) {
    final controller = Get.find<FeedController>();
    return Scaffold(
      backgroundColor: AppColor.Neutral100,
      appBar: AppBar(
        backgroundColor: AppColor.Neutral100,
        title: Text(
          'Feed',
          style: AppTextStyle.heading3(
            color: AppColor.Neutral900,
            fontWeight: AppTextStyle.bold,
          ),
        ),
        actionsPadding: EdgeInsets.symmetric(horizontal: 16.w),

        actions: [
          CustomButtonMedium.primaryMedium(
            color: AppColor.Primary500,
            text: "Write",
            prefixicon: Icon(Icons.edit, color: Colors.white, size: 20.w),
            isLoading: false,
            onPressed: () {},
          ),
        ],
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(vertical: 8.h, horizontal: 16.w),
        child: Column(
          children: [
            CustomTextfield.textFieldRounded(
              controller: TextEditingController(),
              enabled: true,
              hintText: "Search Feeds",
              isObsecureText: false,
              textAlign: TextAlign.start,
              keyBoardType: TextInputType.text,
              prefixicon: SizedBox(
                width: 18.w,
                height: 18.w,
                child: Image.asset(Assets.Assets_appbar_search),
              ),
              validator: (value) {},
            ),
          ],
        ),
      ),
      bottomNavigationBar: CustomBottomNav(initialindex: 1),
    );
  }
}
