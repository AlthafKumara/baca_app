import 'package:baca_app/app/core/color/app_color.dart';
import 'package:baca_app/app/core/constant/asset_constant.dart';
import 'package:baca_app/app/core/font/app_text_style.dart';
import 'package:baca_app/app/core/widget/bottom_nav.dart';
import 'package:baca_app/app/core/widget/button_medium.dart';
import 'package:baca_app/app/core/widget/textfield.dart';
import 'package:baca_app/app/modules/user/feed/controllers/get_feed_controller.dart';
import 'package:baca_app/app/modules/user/feed/widget/feed_message_card.dart';
import 'package:baca_app/app/modules/user/home/controllers/bottomnav_controller.dart';
import 'package:baca_app/app/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';

import '../controllers/feed_controller.dart';

class FeedView extends GetView<FeedController> {
  final feedmessageC = Get.find<GetFeedController>();
  final profileC = Get.find<FeedController>();
  FeedView({super.key});
  @override
  Widget build(BuildContext context) {
    final controller = Get.find<FeedController>();
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: AppColor.Neutral100,
      appBar: AppBar(
        scrolledUnderElevation: 0,
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
            onPressed: () {
              Get.toNamed(Routes.ADD_FEED, arguments: controller.profile.value);
            },
          ),
        ],
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(vertical: 8.h),
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w),
              child: CustomTextfield.textFieldRounded(
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
                validator: null,
              ),
            ),
            SizedBox(height: 24.h),
            Expanded(
              child: feedmessageC.obx(
                (state) {
                  return ListView.builder(
                    itemBuilder: (context, index) {
                      final community = state[index];
                      final profile = profileC.profile.value;
                      return FeedMessageCard(
                        community: community,
                        profile: profile!,
                      );
                    },
                    itemCount: state!.length,
                  );
                },
                onEmpty: Center(
                  child: Text(
                    "No Feed",
                    style: AppTextStyle.body1(
                      color: AppColor.Neutral500,
                      fontWeight: AppTextStyle.regular,
                    ),
                  ),
                ),
                onError: (error) => Center(child: Text(error.toString())),
                onLoading: Center(
                  child: CircularProgressIndicator(color: AppColor.Primary500),
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: CustomBottomNav(initialindex: 1),
    );
  }
}
