import 'package:baca_app/A_laststructure/app/modules/user/book_borrow_detail/controllers/add_review_controller.dart';
import 'package:get/get.dart';

import '../controllers/book_borrow_detail_controller.dart';

class BookBorrowDetailBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<BookBorrowDetailController>(() => BookBorrowDetailController());
    Get.lazyPut<AddReviewController>(() => AddReviewController());
  }
}
