import 'package:baca_app/app/modules/admin/admin_book_borrow_detail/controllers/update_borrow_controller.dart';
import 'package:get/get.dart';

import '../controllers/admin_book_borrow_detail_controller.dart';

class AdminBookBorrowDetailBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AdminBookBorrowDetailController>(
      () => AdminBookBorrowDetailController(),
    );
    Get.lazyPut<UpdateBorrowController>(() => UpdateBorrowController());
  }
}
