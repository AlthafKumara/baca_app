import 'package:baca_app/A_newstructure/features/admin/admin_borrow_detail/view/components/admin_card_status_container.dart';
import 'package:baca_app/A_newstructure/shared/models/borrow_model.dart';
import 'package:baca_app/A_newstructure/shared/styles/app_color.dart';
import 'package:baca_app/A_newstructure/shared/styles/app_text_style.dart';
import 'package:baca_app/A_newstructure/utils/enums/status_enum.dart';
import 'package:baca_app/A_newstructure/utils/functions/date_formatter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BodyOnborrow extends StatelessWidget {
  final Status status;
  final BorrowModel borrow;

  BodyOnborrow({super.key, required this.status, required this.borrow});

  @override
  Widget build(BuildContext context) {
    final dateRequest = DateFormatter.yearMonthDayFormatter(
      datetime: borrow.createdAt,
    );
    final timeRequest = DateFormatter.timeFormatter(datetime: borrow.createdAt);

    final dateBorrow = DateFormatter.yearMonthDayFormatter(
      datetime: borrow.borrowDate,
    );
    final timeBorrow = DateFormatter.timeFormatter(datetime: borrow.borrowDate);

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Request Date",
                style: AppTextStyle.description2(
                  fontWeight: AppTextStyle.medium,
                  color: AppColor.Neutral400,
                ),
              ),
              Text(
                dateRequest,
                style: AppTextStyle.description2(
                  fontWeight: AppTextStyle.medium,
                  color: AppColor.Neutral900,
                ),
                textAlign: TextAlign.end,
              ),
            ],
          ),
          SizedBox(height: 12.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Request Time",
                style: AppTextStyle.description2(
                  fontWeight: AppTextStyle.medium,
                  color: AppColor.Neutral400,
                ),
              ),
              Text(
                timeRequest,
                style: AppTextStyle.description2(
                  fontWeight: AppTextStyle.medium,
                  color: AppColor.Neutral900,
                ),
                textAlign: TextAlign.end,
              ),
            ],
          ),
          SizedBox(height: 12.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Borrow Date Approve",
                style: AppTextStyle.description2(
                  fontWeight: AppTextStyle.medium,
                  color: AppColor.Neutral400,
                ),
              ),
              Text(
                dateBorrow,
                style: AppTextStyle.description2(
                  fontWeight: AppTextStyle.medium,
                  color: AppColor.Neutral900,
                ),
                textAlign: TextAlign.end,
              ),
            ],
          ),
          SizedBox(height: 12.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Borrow Time Approve",
                style: AppTextStyle.description2(
                  fontWeight: AppTextStyle.medium,
                  color: AppColor.Neutral400,
                ),
              ),
              Text(
                timeBorrow,
                style: AppTextStyle.description2(
                  fontWeight: AppTextStyle.medium,
                  color: AppColor.Neutral900,
                ),
                textAlign: TextAlign.end,
              ),
            ],
          ),

          SizedBox(height: 24.h),
          AdminCardStatusContainer(status: status, borrow: borrow),
        ],
      ),
    );
  }
}
