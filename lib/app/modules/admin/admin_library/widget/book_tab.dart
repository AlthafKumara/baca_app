import 'package:baca_app/app/core/color/app_color.dart';
import 'package:baca_app/app/core/font/app_text_style.dart';
import 'package:baca_app/app/core/widget/chip.dart';
import 'package:baca_app/app/data/model/book_model.dart';
import 'package:baca_app/app/modules/admin/admin_library/controllers/book_controller.dart';
import 'package:baca_app/app/modules/admin/admin_library/controllers/chip_controller.dart';
import 'package:baca_app/app/modules/admin/admin_library/widget/default_book_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class BookTab extends StatelessWidget {
  final chipcontroller = Get.find<ChipController>();
  final bookcontroller = Get.find<BookController>();

  BookTab({super.key});

  @override
  Widget build(BuildContext context) {
    List<String> chipsLabel = ["All Book", "Book Available", "On Borrow"];
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 14.h),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Obx(() {
                return Wrap(
                  spacing: 8.w,
                  children: List<Widget>.generate(
                    chipsLabel.length,
                    (index) => CustomChip().filterChip(
                      onTap: () => chipcontroller.onpress(index),

                      title: chipsLabel[index],
                      selected: chipcontroller.selectedIndex.value == index,
                    ),
                  ),
                );
              }),
              GestureDetector(
                onTap: () {},
                child: SizedBox(
                  width: 24.w,
                  height: 24.w,
                  child: Image.asset("assets/library/filter.png"),
                ),
              ),
            ],
          ),
          SizedBox(height: 13.h),
          Expanded(
            child: Obx(() {
              if (bookcontroller.isLoading.value == true) {
                return SizedBox(
                  height: 630.h,
                  child: Center(
                    child: CircularProgressIndicator(
                      color: AppColor.Primary500,
                    ),
                  ),
                );
              }
              if (chipcontroller.selectedIndex.value == 0 &&
                  bookcontroller.books.isNotEmpty) {
                final list = bookcontroller.books;
                return _buildList(list);
              } else if (chipcontroller.selectedIndex.value == 1 &&
                  bookcontroller.books.isNotEmpty) {
                final list = bookcontroller.books
                    .where((b) => b.stock > 0)
                    .toList();
                return _buildList(list);
              } else if (chipcontroller.selectedIndex.value == 2 &&
                  bookcontroller.booksBorrowed.isNotEmpty) {
                final list = bookcontroller.booksBorrowed;

                return _buildList(list);
              } else {
                return SizedBox(
                  height: 630.h,
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(
                          width: 160.w,
                          height: 160.w,
                          child: Image.asset("assets/library/ilustration.png"),
                        ),
                        SizedBox(height: 20.h),
                        Text(
                          "No book found",
                          style: AppTextStyle.heading5(
                            fontWeight: AppTextStyle.medium,
                            color: AppColor.Neutral900,
                          ),
                        ),
                        SizedBox(height: 8.h),
                        Text(
                          "Book data in this category is empty",
                          style: AppTextStyle.description2(
                            fontWeight: AppTextStyle.medium,
                            color: AppColor.Neutral400,
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              }
            }),
          ),
        ],
      ),
    );
  }

  Widget _buildList(List<Book> list) {
    return ListView.builder(
      scrollDirection: Axis.vertical,
      itemBuilder: (context, index) {
        final id = list[index].id;
        final imageUrl = list[index].coverUrl;
        final title = list[index].title;
        final author = list[index].author;
        final description = list[index].description;
        final stock = list[index].stock;
        return DefaultBookCard(
          book: list[index],
          id: id,
          imageUrl: imageUrl,
          title: title,
          author: author,
          description: description,
          stock: stock,
        );
      },
      itemCount: list.length,
    );
  }
}
