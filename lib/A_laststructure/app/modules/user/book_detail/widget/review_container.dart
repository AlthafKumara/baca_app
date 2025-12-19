import 'package:baca_app/A_laststructure/app/core/color/app_color.dart';
import 'package:baca_app/A_laststructure/app/core/font/app_text_style.dart';
import 'package:baca_app/A_laststructure/app/core/utils/date_formatter.dart';
import 'package:baca_app/A_laststructure/app/core/widget/chip.dart';
import 'package:baca_app/A_laststructure/app/data/model/book_review.dart';
import 'package:baca_app/A_laststructure/app/data/model/profiles_model.dart';
import 'package:baca_app/A_laststructure/app/modules/user/book_detail/controllers/get_review_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class ReviewContainer extends StatelessWidget {
  final int bookId;
  final reviewC = Get.find<GetReviewController>();
  ReviewContainer({super.key, required this.bookId});

  @override
  Widget build(BuildContext context) {
    reviewC.fetchReviewbyBookId(bookId);
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 22.h, horizontal: 16.w),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Review",
                style: AppTextStyle.body1(
                  color: AppColor.Neutral900,
                  fontWeight: AppTextStyle.medium,
                ),
              ),
              Obx(
                () => Text.rich(
                  TextSpan(
                    text: "${reviewC.listreview.length}",
                    style: AppTextStyle.body3(
                      color: AppColor.Neutral900,
                      fontWeight: AppTextStyle.medium,
                    ),
                    children: [
                      TextSpan(
                        text: "(Mostly Positive)",
                        style: AppTextStyle.body3(
                          color: AppColor.Neutral500,
                          fontWeight: AppTextStyle.regular,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 12.h),
          reviewC.obx(
            (state) => ListView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemCount: state!.length,
              itemBuilder: (context, index) {
                return userCardReview(
                  profile: state[index].profile!,
                  review: state[index],
                );
              },
            ),
            onEmpty: Center(child: Text("No Review")),
            onLoading: Center(
              child: CircularProgressIndicator(color: AppColor.Primary500),
            ),
          ),
        ],
      ),
    );
  }

  Widget userCardReview({
    required Profile profile,
    required BookReview review,
  }) {
    final dateReview = DateFormatter.yearMonthDayFormatter(
      datetime: review.createdAt,
    );

    final timeReview = DateFormatter.timeFormatter(datetime: review.createdAt);

    return Padding(
      padding: EdgeInsets.symmetric(vertical: 8.h),
      child: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                width: 32.w,
                height: 32.w,
                child: CircleAvatar(
                  backgroundImage: profile.photoProfile != null
                      ? NetworkImage(profile.photoProfile!)
                      : null,
                  child: profile.photoProfile != null
                      ? null
                      : Icon(Icons.person),
                ),
              ),
              SizedBox(width: 8.w),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          profile.name,
                          style: AppTextStyle.body2(
                            fontWeight: AppTextStyle.medium,
                            color: AppColor.Neutral900,
                          ),
                        ),
                        CustomChip().reviewChip(review: review.rating),
                      ],
                    ),
                    SizedBox(height: 10.h),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Expanded(
                          child: Text(
                            review.reviewText,
                            style: AppTextStyle.description2(
                              fontWeight: AppTextStyle.regular,
                              color: AppColor.Neutral500,
                            ),
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 12.h),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          dateReview,
                          style: AppTextStyle.body3(
                            fontWeight: AppTextStyle.medium,
                            color: AppColor.Neutral400,
                          ),
                        ),
                        Text(
                          timeReview,
                          style: AppTextStyle.body3(
                            fontWeight: AppTextStyle.medium,
                            color: AppColor.Neutral400,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
          SizedBox(height: 20.h),
          Divider(color: AppColor.Neutral300, thickness: 1.w),
        ],
      ),
    );
  }
}
