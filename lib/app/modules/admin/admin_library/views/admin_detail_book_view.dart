import 'package:baca_app/app/core/color/app_color.dart';
import 'package:baca_app/app/core/font/app_text_style.dart';
import 'package:baca_app/app/data/model/book_model.dart';
import 'package:baca_app/app/modules/admin/admin_library/controllers/book_catagory_controller.dart';
import 'package:baca_app/app/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';

class AdminDetailBookView extends GetView {
  final categoryC = Get.find<BookCatagoryController>();
  AdminDetailBookView({super.key});

  final Book book = Get.arguments as Book;
  @override
  Widget build(BuildContext context) {
    categoryC.getBookCategoryById(book.category);

    return Scaffold(
      backgroundColor: AppColor.Neutral100,
      appBar: AppBar(
        actionsPadding: EdgeInsets.symmetric(horizontal: 16.w),
        backgroundColor: AppColor.Neutral100,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_rounded, color: Colors.black),
          onPressed: () => Get.back(),
        ),
        actions: [
          GestureDetector(
            onTap: () => Get.toNamed(Routes.ADMIN_FORMBOOK, arguments: book),
            child: Container(
              margin: EdgeInsets.only(right: 16.w),
              child: Icon(Icons.edit, color: AppColor.Primary500),
            ),
          ),

          GestureDetector(child: Icon(Icons.delete, color: AppColor.Danger500)),
        ],
      ),
      body: Padding(
        padding: EdgeInsetsGeometry.symmetric(vertical: 12.h),
        child: ListView(
          children: [
            Container(
              width: 395.w,
              height: 320.h,
              color: AppColor.Neutral250,
              child: Center(
                child: Container(
                  width: 180.w,
                  height: 280.h,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8.r),
                    color: AppColor.Neutral400.withValues(alpha: 0.5),
                    image: DecorationImage(
                      image: NetworkImage(book.coverUrl),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
            ),

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
          ],
        ),
      ),
    );
  }
}
