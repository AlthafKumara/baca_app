import 'package:baca_app/A_newstructure/features/user/user_book_borrow_detail/view/components/card_status_container.dart';
import 'package:baca_app/A_newstructure/shared/models/borrow_model.dart';
import 'package:baca_app/A_newstructure/utils/enums/status_enum.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class UserBodyPending extends StatelessWidget {
  BorrowModel borrow;
  Status status;
  UserBodyPending({super.key, required this.borrow, required this.status});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      child: CardStatusContainer(status: Status.pending, borrow: borrow),
    );
  }
}
