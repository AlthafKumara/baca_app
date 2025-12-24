import 'package:baca_app/A_newstructure/constants/assets_constant.dart';
import 'package:baca_app/A_newstructure/features/admin/admin_borrow_detail/controllers/update_borrow_controller.dart';
import 'package:baca_app/A_newstructure/shared/widgets/bottom_sheet.dart';
import 'package:baca_app/A_newstructure/shared/widgets/button_large.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class BottomNavPending extends StatelessWidget {
  final borrowC = Get.find<UpdateBorrowController>();
  final int borrowId;
  BottomNavPending({super.key, required this.borrowId});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Expanded(
          child: CustomButtonLarge.outlinelarge(
            text: "Reject",
            onPressed: () {
              CustomBottomSheet.doubleBottomSheet(
                height: 400,
                image: Assets.Ilustration_delete,
                title: "Reject this request?",
                message:
                    "If you reject this request, the user will not be able to borrow the book.",
                primarybuttonText: "Reject",
                secondarybuttonText: "Cancel",
                onPressed: () {
                  borrowC.handleRejected(borrowId);
                },
              );
            },
          ),
        ),
        SizedBox(width: 12.w),
        Expanded(
          child: CustomButtonLarge.primarylarge(
            text: "Accept",
            onPressed: () {
              CustomBottomSheet.doubleBottomSheet(
                height: 400,
                image: Assets.Ilustration_borrow,
                title: "Accept this request?",
                message:
                    "If you accept this request, the user will be able to borrow the book.",
                primarybuttonText: "Accept",
                secondarybuttonText: "Cancel",
                onPressed: () {
                  borrowC.handleApproved(borrowId);
                },
              );
            },
          ),
        ),
      ],
    );
  }
}
