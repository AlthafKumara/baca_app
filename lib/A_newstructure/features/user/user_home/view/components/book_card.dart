import 'package:baca_app/A_newstructure/features/user/user_home/controllers/user_home_controller.dart';
import 'package:baca_app/A_newstructure/shared/models/book_model.dart';
import 'package:baca_app/A_newstructure/shared/styles/app_color.dart';
import 'package:baca_app/A_newstructure/shared/styles/app_text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BookCard extends StatelessWidget {
  final BookModel book;
  final UserHomeController controller;

  const BookCard({super.key, required this.book, required this.controller});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        controller.toBookDetail(book: book);
      },
      child: SizedBox(
        width: 160.w,
        height: 250.h,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: 152.w,
              height: 200.h,
              padding: EdgeInsets.all(4.w),
              decoration: BoxDecoration(
                color: AppColor.Neutral100,
                borderRadius: BorderRadius.circular(12.r),
                border: Border.all(
                  color: AppColor.Neutral300,
                  width: 1.w,
                  style: BorderStyle.solid,
                ),
                image: DecorationImage(
                  image: NetworkImage(book.coverUrl),
                  fit: BoxFit.fill,
                ),
              ),
            ),
            SizedBox(height: 8.h),
            Expanded(
              child: Text(
                book.title,
                style: AppTextStyle.body2(
                  fontWeight: AppTextStyle.semiBold,
                  color: AppColor.Neutral900,
                ),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
            ),
            SizedBox(height: 4.h),
            Text(
              book.author,
              style: AppTextStyle.body3(
                fontWeight: AppTextStyle.regular,
                color: AppColor.Neutral400,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
