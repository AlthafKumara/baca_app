import 'package:baca_app/A_newstructure/shared/models/book_model.dart';
import 'package:baca_app/A_newstructure/shared/styles/app_color.dart';
import 'package:baca_app/A_newstructure/shared/styles/app_text_style.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DescriptionBook extends StatelessWidget {
  final BookModel book;
  const DescriptionBook({super.key, required this.book});

  @override
  Widget build(BuildContext context) {
    return Padding(
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
                  book.author,
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
    );
  }
}
