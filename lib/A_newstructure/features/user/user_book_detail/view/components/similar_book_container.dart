import 'package:baca_app/A_newstructure/features/user/user_book_detail/controllers/user_book_detail_controller.dart';
import 'package:baca_app/A_newstructure/features/user/user_book_detail/view/components/book_card.dart';
import 'package:baca_app/A_newstructure/shared/controllers/get_all_book_controller.dart';
import 'package:baca_app/A_newstructure/shared/models/book_model.dart';
import 'package:baca_app/A_newstructure/shared/styles/app_color.dart';
import 'package:baca_app/A_newstructure/shared/styles/app_text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class SimilarBookContainer extends StatelessWidget {
  final similarC = Get.find<GetAllBookController>();
  final UserBookDetailController controller;
  SimilarBookContainer({super.key, required this.controller});

  final currentbook = Get.arguments as BookModel;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 22.h, horizontal: 16.w),
      child: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Similar Like this book",
                style: AppTextStyle.body1(
                  color: AppColor.Neutral900,
                  fontWeight: AppTextStyle.medium,
                ),
              ),
              Text(
                "See All",
                style: AppTextStyle.body3(
                  color: AppColor.Neutral400,
                  fontWeight: AppTextStyle.medium,
                ),
              ),
            ],
          ),
          SizedBox(height: 12.h),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: similarC.obx(
              (state) {
                final similar = state!
                    .where(
                      (book) =>
                          book.name_category == currentbook.name_category &&
                          book.id != currentbook.id,
                    )
                    .toList();

                if (similar.isEmpty) {
                  return SizedBox(
                    width: 160.w,
                    height: 100.h,
                    child: Center(
                      child: Text(
                        "No Book data similar",
                        style: AppTextStyle.body2(
                          fontWeight: AppTextStyle.medium,
                          color: AppColor.Neutral900,
                        ),
                      ),
                    ),
                  );
                }
                return _buildList(similar);
              },
              onLoading: SizedBox(
                width: 160.w,
                height: 250.h,
                child: Center(
                  child: CircularProgressIndicator(color: AppColor.Primary500),
                ),
              ),

              onError: (error) {
                return Center(child: Text(error.toString()));
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildList(List<BookModel> list) {
    return Row(
      children: list.map((book) {
        return Padding(
          padding: EdgeInsets.only(right: 12.w),
          child: BookCard(book: book, controller: controller),
        );
      }).toList(),
    );
  }
}
