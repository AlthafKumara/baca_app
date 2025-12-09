import 'package:baca_app/app/core/color/app_color.dart';
import 'package:baca_app/app/core/font/app_text_style.dart';
import 'package:baca_app/app/data/model/book_model.dart';
import 'package:baca_app/app/routes/app_pages.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class BookCard extends StatelessWidget {
  final Book book;
  final String image;
  final String title;
  final String author;

  const BookCard({
    super.key,
    required this.book,
    required this.image,
    required this.title,
    required this.author,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Get.toNamed(Routes.DETAIL_BOOK, arguments: book),
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
                  image: NetworkImage(image),
                  fit: BoxFit.fill,
                ),
              ),
            ),
            SizedBox(height: 8.h),
            Expanded(
              child: Text(
                title,
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
              author,
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
