import 'package:baca_app/app/core/color/app_color.dart';
import 'package:baca_app/app/core/font/app_text_style.dart';
import 'package:baca_app/app/data/model/book_model.dart';
import 'package:baca_app/app/modules/admin/admin_library/controllers/book_catagory_controller.dart';
import 'package:baca_app/app/modules/admin/admin_library/widget/admin_review_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class AdminDetailBookBody extends StatelessWidget {
  final categoryC = Get.find<BookCatagoryController>();
  AdminDetailBookBody({super.key});
  final Book book = Get.arguments as Book;
  @override
  Widget build(BuildContext context) {
    categoryC.getBookCategoryById(book.category);
    return Padding(
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

          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 22.h),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Expanded(
                      child: SizedBox(
                        width: 100.w,
                        child: Text(
                          "Stock",
                          style: AppTextStyle.description2(
                            fontWeight: AppTextStyle.medium,
                            color: AppColor.Neutral400,
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: Text(
                        "${book.stock.toString()} Stock",
                        style: AppTextStyle.description2(
                          fontWeight: AppTextStyle.medium,
                          color: AppColor.Neutral900,
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 12.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Expanded(
                      child: SizedBox(
                        width: 100.w,
                        child: Text(
                          "Borrowed By",
                          style: AppTextStyle.description2(
                            fontWeight: AppTextStyle.medium,
                            color: AppColor.Neutral400,
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: Text(
                        "10 People",
                        style: AppTextStyle.description2(
                          fontWeight: AppTextStyle.medium,
                          color: AppColor.Neutral900,
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 12.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Expanded(
                      child: SizedBox(
                        width: 100.w,
                        child: Text(
                          "Writer",
                          style: AppTextStyle.description2(
                            fontWeight: AppTextStyle.medium,
                            color: AppColor.Neutral400,
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: Text(
                        "${book.author}",
                        style: AppTextStyle.description2(
                          fontWeight: AppTextStyle.medium,
                          color: AppColor.Neutral900,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
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
          AdminReviewContainer(bookId: book.id),
        ],
      ),
    );
  }
}
