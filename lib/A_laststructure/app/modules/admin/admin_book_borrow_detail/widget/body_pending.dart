import 'package:baca_app/A_laststructure/app/core/color/app_color.dart';
import 'package:baca_app/A_laststructure/app/core/font/app_text_style.dart';
import 'package:baca_app/A_laststructure/app/core/utils/date_formatter.dart';
import 'package:baca_app/A_laststructure/app/data/model/borrow_model.dart';
import 'package:baca_app/A_laststructure/app/modules/admin/admin_book_borrow_detail/widget/admin_card_status_container.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BodyPending extends StatelessWidget {
  final status;
  Borrow borrow;

  BodyPending({super.key, required this.status, required this.borrow});

  @override
  Widget build(BuildContext context) {
    final date = DateFormatter.yearMonthDayFormatter(
      datetime: borrow.createdAt,
    );

    final time = DateFormatter.timeFormatter(datetime: borrow.createdAt);

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
                date,
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
                time,
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
