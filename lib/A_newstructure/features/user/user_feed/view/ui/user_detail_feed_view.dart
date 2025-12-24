import 'package:baca_app/A_newstructure/configs/routes/route.dart';
import 'package:baca_app/A_newstructure/features/user/user_feed/models/community_model.dart';
import 'package:baca_app/A_newstructure/features/user/user_feed/view/components/feed_message_card.dart';
import 'package:baca_app/A_newstructure/features/user/user_feed/view/components/parent_feed_message.dart';
import 'package:baca_app/A_newstructure/shared/models/profile_model.dart';
import 'package:baca_app/A_newstructure/shared/styles/app_color.dart';
import 'package:baca_app/A_newstructure/shared/styles/app_text_style.dart';
import 'package:baca_app/A_newstructure/shared/widgets/textfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class UserDetailFeedView extends StatelessWidget {
  const UserDetailFeedView({super.key});

  @override
  Widget build(BuildContext context) {
    final CommunityModel? community = Get.arguments["community"];
    final ProfileModel? profile = Get.arguments["profile"];

    if (community == null) {
      return Scaffold(
        body: Center(
          child: Text('Community is null', style: TextStyle(fontSize: 20)),
        ),
      );
    }

    if (profile == null) {
      return Scaffold(
        body: Center(
          child: Text('profile is null', style: TextStyle(fontSize: 20)),
        ),
      );
    }

    final coParrent = community.profile;
    final coBook = community.book;
    final coChild = community.replies;
    final coChildPro = community.replies.map((e) => e.profile).toList();

    return Scaffold(
      backgroundColor: AppColor.Neutral100,
      appBar: AppBar(
        scrolledUnderElevation: 0,
        backgroundColor: AppColor.Neutral100,
        leading: GestureDetector(
          onTap: () => Get.back(),
          child: Icon(Icons.arrow_back, color: AppColor.Neutral900, size: 24.w),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(vertical: 16.h),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            ParentFeedMessage(community: community, profile: profile),
            SizedBox(height: 24.h),
            Divider(color: AppColor.Neutral200, thickness: 8.h),
            SizedBox(height: 24.h),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        "${coChild.length} replies",
                        style: AppTextStyle.body1(
                          color: AppColor.Neutral400,
                          fontWeight: AppTextStyle.medium,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 16.h),
                  ...coChild.map(
                    (community) =>
                        FeedMessageCard(community: community, profile: profile),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Padding(
        padding: EdgeInsetsGeometry.fromLTRB(16.w, 16.h, 16.w, 22.h),
        child: Row(
          children: [
            SizedBox(
              width: 48.w,
              height: 48.w,
              child: CircleAvatar(
                backgroundImage: profile.photoProfile != ""
                    ? NetworkImage(profile.photoProfile!)
                    : null,
                child: profile.photoProfile == ""
                    ? const Icon(Icons.person)
                    : null,
              ),
            ),
            SizedBox(width: 12.w),
            Expanded(
              child: GestureDetector(
                onTap: () {
                  Get.toNamed(
                    Routes.USER_REPLY_FEED,
                    arguments: {"community": community, "profile": profile},
                  );
                },
                child: CustomTextfield.textFieldRounded(
                  controller: TextEditingController(),
                  enabled: false,
                  hintText: "Reply Here",
                  isObsecureText: false,
                  maxLines: 1,
                  keyBoardType: TextInputType.text,
                  textAlign: TextAlign.start,
                  validator: null,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
