import 'package:baca_app/app/core/color/app_color.dart';
import 'package:baca_app/app/core/font/app_text_style.dart';
import 'package:baca_app/app/data/model/borrow_model.dart';
import 'package:baca_app/app/modules/admin/admin_library/controllers/borrow_controller.dart';
import 'package:baca_app/app/modules/admin/admin_library/widget/book_borrow_card.dart';
import 'package:baca_app/app/modules/admin/admin_library/widget/empty_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class TransactionReturned extends StatelessWidget {
  final borrowC = Get.find<BorrowController>();
  TransactionReturned({super.key});

  @override
  Widget build(BuildContext context) {
    return borrowC.obx(
      (state) {
        final finalstate = state
            ?.where((e) => e.status == Status.returned)
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
      onEmpty: EmptyContainer(),
      onLoading: Center(
        child: CircularProgressIndicator(color: AppColor.Primary500),
      ),
      onError: (error) => Center(child: Text(error.toString())),
    );
  }
}
