import 'package:baca_app/app/core/color/app_color.dart';
import 'package:baca_app/app/core/font/app_text_style.dart';
import 'package:baca_app/app/data/model/borrow_model.dart';
import 'package:baca_app/app/modules/admin/admin_library/controllers/borrow_controller.dart';
import 'package:baca_app/app/modules/admin/admin_library/widget/book_borrow_card.dart';
import 'package:baca_app/app/modules/user/library/widget/empty_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class TransactionBorrow extends StatelessWidget {
  final borrowC = Get.find<BorrowController>();
  TransactionBorrow({super.key});

  @override
  Widget build(BuildContext context) {
    return borrowC.obx(
      (state) {
        final finalstate = state
            ?.where((e) => e.status == Status.onBorrow)
            .toList();
        if (finalstate!.isEmpty) {
          return EmptyContainer();
        }
        return ListView.builder(
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          itemCount: finalstate.length,
          itemBuilder: (context, index) {
            final list = finalstate[index];

            return BookBorrowCard(borrow: finalstate, index: index);
          },
        );
      },
      onEmpty: Center(
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
      onLoading: Center(
        child: CircularProgressIndicator(color: AppColor.Primary500),
      ),
      onError: (error) => Center(child: Text(error.toString())),
    );
  }
}
