import 'package:baca_app/A_laststructure/app/core/color/app_color.dart';
import 'package:baca_app/A_laststructure/app/core/constant/asset_constant.dart';
import 'package:baca_app/A_laststructure/app/core/font/app_text_style.dart';
import 'package:baca_app/A_laststructure/app/core/widget/bottom_sheet.dart';
import 'package:baca_app/A_laststructure/app/core/widget/textfield.dart';
import 'package:baca_app/A_laststructure/app/modules/user/feed/controllers/form_feed_controller.dart';
import 'package:baca_app/A_laststructure/app/modules/user/feed/controllers/get_book_feed_controller.dart';
import 'package:baca_app/A_laststructure/app/modules/user/feed/widget/feed_book_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class FormFeedBottomNav extends StatelessWidget {
  final void Function()? onTapUpload;
  final String uploadText;
  final formC = Get.find<FormFeedController>();
  final bookC = Get.find<GetBookFeedController>();
  FormFeedBottomNav({
    super.key,
    required this.onTapUpload,
    required this.uploadText,
  });

  @override
  Widget build(BuildContext context) {
    return AnimatedPadding(
      duration: Duration(milliseconds: 200),
      curve: Curves.easeOut,
      padding: EdgeInsets.only(
        bottom: MediaQuery.of(context).viewInsets.bottom,
      ),
      child: Container(
        decoration: BoxDecoration(
          border: Border(
            top: BorderSide(color: AppColor.Neutral300, width: 1.w),
          ),
        ),
        padding: EdgeInsetsGeometry.fromLTRB(16.w, 16.h, 16.w, 32.h),
        child: Row(
          children: [
            GestureDetector(
              onTap: () {
                _bookbottomsheet();
              },
              child: SizedBox(
                width: 32.w,
                height: 32.w,
                child: CircleAvatar(
                  backgroundColor: AppColor.Neutral250,
                  child: Image.asset(Assets.Assets_library_link),
                ),
              ),
            ),
            SizedBox(width: 16.w),
            Expanded(
              child: Obx(() {
                return Text(
                  "${formC.messageText.value.length.toString()} / 200 characters",
                  style: AppTextStyle.body2(
                    color: AppColor.Neutral400,
                    fontWeight: AppTextStyle.medium,
                  ),
                );
              }),
            ),
            SizedBox(width: 16.w),
            GestureDetector(
              onTap: onTapUpload,
              child: Text(
                uploadText,
                style: AppTextStyle.body2(
                  color: AppColor.Primary500,
                  fontWeight: AppTextStyle.medium,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _bookbottomsheet() {
    return CustomBottomSheet.singleBottomSheetWidget(
      buttonText: "Close",
      buttongap: 20,
      onPressed: () {
        Get.back();
      },
      height: 700,
      child: SingleChildScrollView(
        physics: const ClampingScrollPhysics(),
        child: Column(
          children: [
            CustomTextfield.textFieldRounded(
              controller: bookC.searchController,
              prefixicon: SizedBox(
                width: 18.w,
                height: 18.w,
                child: Image.asset(Assets.Assets_appbar_search),
              ),
              hintText: "Search",
              enabled: true,
              keyBoardType: TextInputType.text,
              validator: null,
              isObsecureText: false,
            ),
            SizedBox(height: 28.h),
            SizedBox(
              height: 475.h,
              child: bookC.obx(
                (state) {
                  return GridView.builder(
                    physics: const BouncingScrollPhysics(),
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 16.w,
                      mainAxisSpacing: 16.h,
                      childAspectRatio: 8 / 12,
                    ),
                    itemCount: state!.length,
                    itemBuilder: (context, index) {
                      final book = state[index];
                      return Obx(() {
                        final isSelected =
                            bookC.selectedBookId.value == book.id;

                        return FeedBookCard(
                          book: state[index],
                          isSelected: isSelected,
                          ontap: () {
                            bookC.toggleBook(book.id);
                          },
                        );
                      });
                    },
                  );
                },
                onEmpty: Center(
                  child: Text(
                    "No book found",
                    style: AppTextStyle.body1(
                      color: AppColor.Neutral900,
                      fontWeight: AppTextStyle.regular,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
