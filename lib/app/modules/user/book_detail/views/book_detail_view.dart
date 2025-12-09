import 'package:baca_app/app/core/color/app_color.dart';
import 'package:baca_app/app/core/font/app_text_style.dart';
import 'package:baca_app/app/core/widget/button_large.dart';
import 'package:baca_app/app/data/model/book_model.dart';
import 'package:baca_app/app/modules/user/book_detail/controllers/book_category_controller.dart';
import 'package:baca_app/app/modules/user/book_detail/controllers/similar_book_controller.dart';
import 'package:baca_app/app/modules/user/book_detail/widget/description_book_container.dart';
import 'package:baca_app/app/modules/user/book_detail/widget/image_container.dart';
import 'package:baca_app/app/modules/user/book_detail/widget/review_container.dart';
import 'package:baca_app/app/modules/user/book_detail/widget/similar_book_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';

import '../controllers/book_detail_controller.dart';

class BookDetailView extends GetView<BookDetailController> {
  final categoryC = Get.find<BookCategoryController>();
  BookDetailView({super.key});

  final Book book = Get.arguments as Book;
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
            DescriptionBook(stock: book.stock, author: book.author),
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
            ReviewContainer(),
            Divider(color: AppColor.Neutral250, thickness: 8.h),
            SimilarBookContainer(),
          ],
        ),
      ),
      bottomNavigationBar: Padding(
        padding: EdgeInsets.fromLTRB(16.w, 5.h, 16.w, 20.h),
        child: Row(
          children: [
            SizedBox(
              width: 88.w,
              child: CustomButtonLarge.outlinelarge(
                suffixicon: Image.asset("assets/home/save.png"),
              ),
            ),
            SizedBox(width: 12.w),
            Expanded(
              child: CustomButtonLarge.primarylarge(
                onPressed: () {},
                text: "Borrow Now",
              ),
            ),
          ],
        ),
      ),
    );
  }
}
