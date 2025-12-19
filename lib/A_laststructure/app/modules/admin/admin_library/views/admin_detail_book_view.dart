import 'package:baca_app/A_laststructure/app/core/color/app_color.dart';
import 'package:baca_app/A_laststructure/app/core/constant/asset_constant.dart';
import 'package:baca_app/A_laststructure/app/core/font/app_text_style.dart';
import 'package:baca_app/A_laststructure/app/core/widget/bottom_sheet.dart';
import 'package:baca_app/A_laststructure/app/data/model/book_model.dart';
import 'package:baca_app/A_laststructure/app/modules/admin/admin_library/controllers/book_catagory_controller.dart';
import 'package:baca_app/A_laststructure/app/modules/admin/admin_library/controllers/book_controller.dart';
import 'package:baca_app/A_laststructure/app/modules/admin/admin_library/widget/admin_detail_book_body.dart';
import 'package:baca_app/A_laststructure/app/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';

class AdminDetailBookView extends GetView {
  final categoryC = Get.find<BookCatagoryController>();
  final bookC = Get.find<BookController>();
  AdminDetailBookView({super.key});

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
        actions: [
          GestureDetector(
            onTap: () => Get.toNamed(Routes.ADMIN_FORMBOOK, arguments: book),
            child: Container(
              margin: EdgeInsets.only(right: 16.w),
              child: Icon(Icons.edit, color: AppColor.Primary500),
            ),
          ),

          GestureDetector(
            child: Icon(Icons.delete, color: AppColor.Danger500),
            onTap: () {
              CustomBottomSheet.doubleBottomSheet(
                height: 375,
                image: Assets.Assets_library_ilustration_delete,
                message:
                    "Are you sure want to delete ${book.title} ? You will not be able to maintain this book",
                primarybuttonText: "Delete",
                secondarybuttonText: "Cancel",
                onPressed: () {
                  bookC.deleteSelectBooks([book.id]);
                  Get.back();
                },
                title: "Delete Book",
              );
            },
          ),
        ],
      ),
      body: AdminDetailBookBody(),
    );
  }
}
