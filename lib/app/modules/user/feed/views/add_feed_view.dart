import 'package:baca_app/app/core/color/app_color.dart';
import 'package:baca_app/app/core/constant/asset_constant.dart';
import 'package:baca_app/app/core/font/app_text_style.dart';
import 'package:baca_app/app/core/widget/textfield.dart';
import 'package:baca_app/app/data/model/profiles_model.dart';
import 'package:baca_app/app/modules/user/feed/controllers/feed_controller.dart';
import 'package:baca_app/app/modules/user/feed/controllers/form_feed_controller.dart';
import 'package:baca_app/app/modules/user/feed/controllers/get_book_feed_controller.dart';
import 'package:baca_app/app/modules/user/feed/widget/chip_you.dart';
import 'package:baca_app/app/modules/user/feed/widget/feed_single_book_card.dart';
import 'package:baca_app/app/modules/user/feed/widget/form_feed_bottom_nav.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';

class AddFeedView extends GetView<FeedController> {
  final formC = Get.find<FormFeedController>();
  final bookC = Get.find<GetBookFeedController>();
  AddFeedView({super.key});

  final profile = Get.arguments as Profile;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: AppColor.Neutral100,
      appBar: AppBar(
        backgroundColor: AppColor.Neutral100,
        leading: GestureDetector(
          onTap: () => Get.back(),
          child: Icon(
            Icons.arrow_back_rounded,
            color: AppColor.Neutral900,
            size: 24.w,
          ),
        ),
        title: Text(
          'Write to Feed',
          style: AppTextStyle.body1(
            fontWeight: AppTextStyle.medium,
            color: AppColor.Neutral900,
          ),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  SizedBox(
                    height: 40.w,
                    width: 40.w,
                    child: CircleAvatar(
                      backgroundImage: profile.photoProfile != null
                          ? NetworkImage(profile.photoProfile!)
                          : null,
                      child: profile.photoProfile != null
                          ? null
                          : Icon(Icons.person),
                    ),
                  ),
                  SizedBox(width: 12.w),
                  Text(
                    profile.name,
                    style: AppTextStyle.body2(
                      color: AppColor.Neutral900,
                      fontWeight: AppTextStyle.semiBold,
                    ),
                  ),
                  SizedBox(width: 12.w),
                  ChipYou(),
                ],
              ),
              SizedBox(height: 12.h),
              CustomTextfield.textFieldBlank(
                controller: formC.messageController,
                enabled: true,
                hintText: "Write something....",
                keyBoardType: TextInputType.text,
                maxLines: 10,
                validator: null,
              ),
              SizedBox(height: 12.h),
              Obx(() {
                final bookId = formC.selectedBookId;

                if (bookId == null) {
                  return SizedBox.shrink();
                }
                final book = bookC.getBookById(bookId);

                return FeedSingleBookCard(book: book);
              }),
            ],
          ),
        ),
      ),
      bottomNavigationBar: FormFeedBottomNav(
        onTapUpload: () {
          formC.handleSubmitFeed();
        },
        uploadText: "Post",
      ),
    );
  }
}
