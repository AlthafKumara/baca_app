import 'package:baca_app/A_newstructure/features/admin/admin_library/controllers/get_book_borrow_controller.dart';
import 'package:baca_app/A_newstructure/features/admin/admin_library/view/components/book_borrow_card.dart';
import 'package:baca_app/A_newstructure/features/admin/admin_library/view/components/empty_container.dart';
import 'package:baca_app/A_newstructure/shared/styles/app_color.dart';
import 'package:baca_app/A_newstructure/utils/enums/status_enum.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TransactionReturned extends StatelessWidget {
  final borrowC = Get.find<GetBookBorrowController>();
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

            return BookBorrowCard(borrow: list);
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
