import 'package:baca_app/A_laststructure/app/data/model/borrow_model.dart';
import 'package:baca_app/A_laststructure/app/modules/user/book_borrow_detail/widget/card_status_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class UserBodyPending extends StatelessWidget {
  Borrow borrow;
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
