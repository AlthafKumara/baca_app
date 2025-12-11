import 'package:get/get.dart';

import '../controllers/book_borrow_detail_controller.dart';

class BookBorrowDetailBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<BookBorrowDetailController>(
      () => BookBorrowDetailController(),
    );
  }
}
