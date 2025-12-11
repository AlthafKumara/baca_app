import 'package:baca_app/app/core/color/app_color.dart';
import 'package:baca_app/app/core/font/app_text_style.dart';
import 'package:baca_app/app/data/model/book_model.dart';
import 'package:baca_app/app/data/model/borrow_model.dart';
import 'package:baca_app/app/modules/user/library/controllers/borrow_controller.dart';

import 'package:baca_app/app/modules/user/library/widget/card_status_container.dart';
import 'package:baca_app/app/modules/user/library/widget/empty_container.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ReturnedContainer extends StatelessWidget {
  final borrowC = Get.find<BorrowController>();
  ReturnedContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return borrowC.obx(
      (state) {
        final list = state?.where((e) => e.status == Status.returned).toList();

        if (list!.isEmpty) {
          return EmptyContainer();
        }
        return ListView.builder(
          itemCount: list.length,
          itemBuilder: (context, index) {
            final book = list[index].book as Book;
            return CardStatusContainer(
              status: "Returned",
              borrow: list,
              index: index,
            );
          },
        );
      },
      onEmpty: EmptyContainer(),
      onError: (error) {
        print(error);
        return Center(
          child: Text(
            error.toString(),
            style: AppTextStyle.body1(
              color: AppColor.Neutral900,
              fontWeight: AppTextStyle.regular,
            ),
          ),
        );
      },
    );
  }
}
