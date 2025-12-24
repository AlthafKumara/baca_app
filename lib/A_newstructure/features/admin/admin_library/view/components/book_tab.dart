import 'package:baca_app/A_newstructure/constants/assets_constant.dart';
import 'package:baca_app/A_newstructure/features/admin/admin_library/view/components/default_book_card.dart';
import 'package:baca_app/A_newstructure/shared/controllers/chip_controller.dart';
import 'package:baca_app/A_newstructure/shared/controllers/get_all_book_controller.dart';
import 'package:baca_app/A_newstructure/shared/models/book_model.dart';
import 'package:baca_app/A_newstructure/shared/styles/app_color.dart';
import 'package:baca_app/A_newstructure/shared/styles/app_text_style.dart';
import 'package:baca_app/A_newstructure/shared/widgets/chip.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class BookTab extends StatelessWidget {
  final chipcontroller = Get.find<ChipController>();
  final bookcontroller = Get.find<GetAllBookController>();

  BookTab({super.key});

  @override
  Widget build(BuildContext context) {
    List<String> chipsLabel = ["All Book", "Book Available"];
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
                  child: Image.asset(Assets.Icon_filter),
                ),
              ),
            ],
          ),
          SizedBox(height: 13.h),
          Expanded(
            child: bookcontroller.obx((state) {
              if (state == null) {
                return const Center(child: CircularProgressIndicator());
              }

              if (chipcontroller.selectedIndex.value == 1) {
                final list = bookcontroller.allbooks
                    .where((b) => b.stock > 0)
                    .toList();
                return _buildList(list);
              }

              return _buildList(state);
            }, onLoading: Center(child: CircularProgressIndicator())),
          ),
        ],
      ),
    );
  }

  Widget _buildList(List<BookModel> list) {
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
