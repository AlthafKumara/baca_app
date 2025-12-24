import 'package:baca_app/A_newstructure/configs/routes/route.dart';
import 'package:baca_app/A_newstructure/constants/assets_constant.dart';
import 'package:baca_app/A_newstructure/shared/controllers/delete_book_controller.dart';
import 'package:baca_app/A_newstructure/features/admin/admin_book_detail/view/components/admin_detail_book_body.dart';
import 'package:baca_app/A_newstructure/features/user/user_book_detail/controllers/get_category_book_controller.dart';
import 'package:baca_app/A_newstructure/shared/models/book_model.dart';
import 'package:baca_app/A_newstructure/shared/styles/app_color.dart';
import 'package:baca_app/A_newstructure/shared/widgets/bottom_sheet.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class AdminBookDetailView extends GetView {
  final categoryC = Get.find<GetCategoryBookController>();
  final bookC = Get.find<DeleteBookController>();
  AdminBookDetailView({super.key});

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
                image: Assets.Ilustration_delete,
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
