import 'package:baca_app/app/core/color/app_color.dart';
import 'package:baca_app/app/core/font/app_text_style.dart';
import 'package:baca_app/app/data/model/book_model.dart';
import 'package:baca_app/app/modules/admin/admin_library/controllers/card_controller.dart';
import 'package:baca_app/app/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class DefaultBookCard extends StatelessWidget {
  final Book book;
  final int id;
  final String imageUrl;
  final String title;
  final String author;
  final String description;
  final int stock;

  DefaultBookCard({
    required this.book,
    required this.id,
    super.key,
    required this.imageUrl,
    required this.title,
    required this.author,
    required this.description,
    required this.stock,
  });

  final cardController = Get.find<CardController>();

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      final showCheckBox = cardController.selectedMode.value;
      final isSelected = cardController.isCardSelected(id);
      return GestureDetector(
        onLongPress: () => cardController.selectedMode.value = true,

        onTap: () => showCheckBox
            ? cardController.toggleSelect(id)
            : Get.toNamed(Routes.ADMIN_DETAIL_BOOK, arguments: book),
        child: Container(
          margin: EdgeInsets.only(bottom: 16.h),
          padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 16.h),
          decoration: BoxDecoration(
            color: AppColor.Neutral100,
            borderRadius: BorderRadius.circular(12.r),
            shape: BoxShape.rectangle,
            border: Border.all(
              color: cardController.isCardSelected(id)
                  ? AppColor.Primary500
                  : AppColor.Neutral300,
              width: 1.w,
              style: BorderStyle.solid,
            ),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              if (showCheckBox)
                Checkbox(
                  checkColor: AppColor.Neutral100,
                  activeColor: AppColor.Primary500,
                  value: isSelected,
                  onChanged: (value) {
                    cardController.toggleSelect(id);
                  },
                ),
              Container(
                width: 88.w,
                height: 118.h,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12.r),
                  shape: BoxShape.rectangle,
                  border: Border.all(
                    color: AppColor.Neutral300,
                    style: BorderStyle.solid,
                    width: 1.w,
                  ),
                  image: DecorationImage(
                    image: NetworkImage(imageUrl),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              SizedBox(width: 12.w),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: AppTextStyle.body2(
                        fontWeight: AppTextStyle.bold,
                        color: AppColor.Neutral900,
                      ),
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                    ),
                    SizedBox(height: 6.h),
                    Text(
                      author,
                      style: AppTextStyle.body2(
                        fontWeight: AppTextStyle.medium,
                        color: AppColor.Neutral400,
                      ),
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                    ),
                    SizedBox(height: 6.h),
                    Text(
                      "${stock.toString()} Stock",
                      style: AppTextStyle.body3(
                        fontWeight: AppTextStyle.medium,
                        color: AppColor.Primary500,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      );
    });
  }
}
