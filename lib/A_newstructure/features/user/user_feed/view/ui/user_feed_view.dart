import 'package:baca_app/A_newstructure/configs/routes/route.dart';
import 'package:baca_app/A_newstructure/constants/assets_constant.dart';
import 'package:baca_app/A_newstructure/features/user/user_feed/controllers/get_feed_controller.dart';
import 'package:baca_app/A_newstructure/features/user/user_feed/controllers/user_feed_controller.dart';
import 'package:baca_app/A_newstructure/features/user/user_feed/view/components/feed_message_card.dart';
import 'package:baca_app/A_newstructure/shared/styles/app_color.dart';
import 'package:baca_app/A_newstructure/shared/styles/app_text_style.dart';
import 'package:baca_app/A_newstructure/shared/widgets/button_medium.dart';
import 'package:baca_app/A_newstructure/shared/widgets/snackbar.dart';
import 'package:baca_app/A_newstructure/shared/widgets/textfield.dart';
import 'package:baca_app/A_newstructure/shared/widgets/user_bottom_nav.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class UserFeedView extends StatelessWidget {
  final feedmessageC = Get.find<GetFeedController>();
  final profileC = Get.find<UserFeedController>();
  UserFeedView({super.key});
  @override
  Widget build(BuildContext context) {
    final controller = Get.find<UserFeedController>();
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
              final profile = controller.profile.value;

              if (profile == null) {
                CustomSnackbar.succesSnackbar("Profile sedang di load");
              }
              Get.toNamed(
                Routes.USER_ADD_FEED,
                arguments: controller.profile.value,
              );
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
                  child: Image.asset(Assets.Icon_search),
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

                      if (profile == null) {
                        return CircularProgressIndicator(
                          color: AppColor.Primary500,
                        );
                      }
                      return FeedMessageCard(
                        ontap: () {
                          Get.toNamed(
                            Routes.USER_DETAIL_FEED,
                            arguments: {
                              "community": community,
                              "profile": profile,
                            },
                          );
                        },
                        community: community,
                        profile: profile,
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
      bottomNavigationBar: UserBottomNav(initialindex: 1),
    );
  }
}
