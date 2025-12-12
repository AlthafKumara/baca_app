import 'package:baca_app/app/core/widget/bottom_sheet.dart';
import 'package:baca_app/app/core/widget/button_large.dart';
import 'package:baca_app/app/modules/admin/admin_book_borrow_detail/controllers/update_borrow_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BottomNavBorrow extends StatelessWidget {
  final borrowC = Get.find<UpdateBorrowController>();
  final int borrowId;
  BottomNavBorrow({super.key, required this.borrowId});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: CustomButtonLarge.primarylarge(
            text: "Return",
            onPressed: () {
              CustomBottomSheet.doubleBottomSheet(
                height: 400,
                image: "assets/library/ilustration_borrow.png",
                title: "Update as Return book?",
                message:
                    "If you accept this request, the user status borrowed will change to return this book.",
                primarybuttonText: "Return",
                secondarybuttonText: "Cancel",
                onPressed: () {
                  borrowC.handleReturned(borrowId);
                },
              );
            },
          ),
        ),
      ],
    );
  }
}
