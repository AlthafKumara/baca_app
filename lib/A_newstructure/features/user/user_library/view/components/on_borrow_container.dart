import 'package:baca_app/A_newstructure/features/user/user_library/controllers/get_book_borrow_by_user_controller.dart';
import 'package:baca_app/A_newstructure/features/user/user_library/view/components/empty_container.dart';
import 'package:baca_app/A_newstructure/features/user/user_library/view/components/library_card_status_container.dart';
import 'package:baca_app/A_newstructure/shared/models/book_model.dart';
import 'package:baca_app/A_newstructure/shared/styles/app_color.dart';
import 'package:baca_app/A_newstructure/shared/styles/app_text_style.dart';
import 'package:baca_app/A_newstructure/utils/enums/status_enum.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class OnBorrowContainer extends StatelessWidget {
  
  const OnBorrowContainer({super.key});

  @override
  Widget build(BuildContext context) {
    final borrowC = Get.find<GetBookBorrowByUserController>();
    return borrowC.obx(
      (state) {
        final list = state?.where((e) => e.status == Status.onBorrow).toList();

        if (list!.isEmpty) {
          return EmptyContainer();
        }
        return ListView.builder(
          itemCount: list.length,
          itemBuilder: (context, index) {
            final book = list[index].book as BookModel;
            final borrow = list[index];
            return LibraryCardStatusContainer(
              status: Status.onBorrow,
              borrow: borrow,
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
