import 'package:baca_app/A_newstructure/constants/assets_constant.dart';
import 'package:baca_app/A_newstructure/features/user/user_book_detail/controllers/get_category_book_controller.dart';
import 'package:baca_app/A_newstructure/features/user/user_book_detail/controllers/handle_borrow_controller.dart';
import 'package:baca_app/A_newstructure/features/user/user_book_detail/controllers/user_book_detail_controller.dart';
import 'package:baca_app/A_newstructure/features/user/user_book_detail/view/components/image_container.dart';
import 'package:baca_app/A_newstructure/features/user/user_book_detail/view/components/review_container.dart';
import 'package:baca_app/A_newstructure/features/user/user_book_detail/view/components/saved_bottom_sheet.dart';
import 'package:baca_app/A_newstructure/features/user/user_book_detail/view/components/similar_book_container.dart';
import 'package:baca_app/A_newstructure/features/user/user_book_detail/view/components/user_description_book.dart';
import 'package:baca_app/A_newstructure/shared/models/book_model.dart';
import 'package:baca_app/A_newstructure/shared/styles/app_color.dart';
import 'package:baca_app/A_newstructure/shared/styles/app_text_style.dart';
import 'package:baca_app/A_newstructure/shared/widgets/bottom_sheet.dart';
import 'package:baca_app/A_newstructure/shared/widgets/button_large.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class UserBookDetailView extends GetView<UserBookDetailController> {
  final categoryC = Get.find<GetCategoryBookController>();
  final borrowC = Get.find<HandleBorrowController>();

  UserBookDetailView({super.key});

  final BookModel book = Get.arguments as BookModel;
  @override
  Widget build(BuildContext context) {
    categoryC.getBookCategoryById(book.category);
    return Scaffold(
      backgroundColor: AppColor.Neutral100,
      appBar: AppBar(
        scrolledUnderElevation: 0,
        actionsPadding: EdgeInsets.symmetric(horizontal: 16.w),
        backgroundColor: AppColor.Neutral100,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_rounded, color: Colors.black),
          onPressed: () => Get.back(),
        ),
        centerTitle: true,
        title: Text(
          "Details",
          style: AppTextStyle.heading5(
            fontWeight: AppTextStyle.bold,
            color: AppColor.Neutral900,
          ),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(vertical: 12.h),
        child: ListView(
          children: [
            ImageContainer(imageUrl: book.coverUrl),
            Padding(
              padding: EdgeInsetsGeometry.symmetric(
                horizontal: 16.w,
                vertical: 22.h,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Obx(() {
                    final categoryName = categoryC.category.value;

                    if (categoryName == null) {
                      return Chip(
                        backgroundColor: AppColor.Neutral200,
                        side: BorderSide(
                          color: AppColor.Neutral300,
                          style: BorderStyle.solid,
                          width: 1.w,
                        ),

                        labelStyle: AppTextStyle.body3(
                          fontWeight: AppTextStyle.medium,
                          color: AppColor.Neutral900,
                        ),

                        label: Text("Unknown"),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(999.r),
                        ),
                      );
                    }

                    return Chip(
                      backgroundColor: AppColor.Neutral200,
                      side: BorderSide(
                        color: AppColor.Neutral300,
                        style: BorderStyle.solid,
                        width: 1.w,
                      ),

                      labelStyle: AppTextStyle.body3(
                        fontWeight: AppTextStyle.medium,
                        color: AppColor.Neutral900,
                      ),

                      label: Text(categoryName.categoryName),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(999.r),
                      ),
                    );
                  }),
                  SizedBox(height: 16.h),
                  Text(
                    book.title,
                    style: AppTextStyle.heading4(
                      fontWeight: AppTextStyle.medium,
                      color: AppColor.Neutral900,
                    ),
                  ),
                ],
              ),
            ),
            Divider(color: AppColor.Neutral250, thickness: 8.h),
            DescriptionBook(book: book),
            Divider(color: AppColor.Neutral250, thickness: 8.h),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 22.h, horizontal: 16.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Synopsis",
                    style: AppTextStyle.body1(
                      fontWeight: AppTextStyle.medium,
                      color: AppColor.Neutral900,
                    ),
                  ),
                  SizedBox(height: 12.h),
                  Text(
                    book.description,
                    style: AppTextStyle.description2(
                      fontWeight: AppTextStyle.regular,
                      color: AppColor.Neutral500,
                    ),
                    maxLines: 10,
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
            ),
            Divider(color: AppColor.Neutral250, thickness: 8.h),
            ReviewContainer(bookId: book.id),
            Divider(color: AppColor.Neutral250, thickness: 8.h),
            SimilarBookContainer(controller: controller),
          ],
        ),
      ),
      bottomNavigationBar: Padding(
        padding: EdgeInsets.fromLTRB(16.w, 5.h, 16.w, 20.h),
        child: Row(
          children: [
            GestureDetector(
              onTap: () {
                SavedBottomSheet().savedBottomsheet(bookId: book.id);
              },
              child: SizedBox(
                width: 88.w,
                child: CustomButtonLarge.outlinelarge(
                  suffixicon: Image.asset(Assets.Icon_save),
                ),
              ),
            ),
            SizedBox(width: 12.w),
            Expanded(
              child: CustomButtonLarge.primarylarge(
                onPressed: () {
                  CustomBottomSheet.doubleBottomSheet(
                    image: Assets.Ilustration_borrow,
                    title: "Borrow This Book Now?",
                    primarybuttonText: "Yes, Borrow",
                    secondarybuttonText: "Cancel",
                    message:
                        "Are you sure to borrow this book? Once you borrow, you must scan the QR to the librarian!",
                    onPressed: () {
                      borrowC.handleBorrow(
                        userId: controller.profile.value!.id,
                        bookId: book.id,
                      );
                    },
                  );
                },
                text: "Borrow Now",
              ),
            ),
          ],
        ),
      ),
    );
  }
}
