import 'package:baca_app/A_newstructure/features/admin/admin_book_detail/controllers/form_controller.dart';
import 'package:baca_app/A_newstructure/features/admin/admin_library/controllers/admin_card_controller.dart';
import 'package:baca_app/A_newstructure/features/admin/admin_library/controllers/admin_library_controller.dart';
import 'package:baca_app/A_newstructure/features/admin/admin_library/controllers/admin_tab_page_controller.dart';
import 'package:baca_app/A_newstructure/features/admin/admin_library/controllers/get_book_borrow_controller.dart';
import 'package:baca_app/A_newstructure/shared/controllers/chip_controller.dart';
import 'package:baca_app/A_newstructure/shared/controllers/delete_book_controller.dart';
import 'package:baca_app/A_newstructure/shared/controllers/get_all_book_controller.dart';
import 'package:baca_app/A_newstructure/shared/controllers/get_book_review.dart';
import 'package:get/get.dart';

class AdminLibraryBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<FormControllerController>(() => FormControllerController());
    Get.lazyPut<DeleteBookController>(() => DeleteBookController());
    Get.lazyPut<AdminLibraryController>(() => AdminLibraryController());
    Get.lazyPut<AdminCardController>(() => AdminCardController());
    Get.lazyPut<AdminTabPageController>(() => AdminTabPageController());
    Get.lazyPut<ChipController>(() => ChipController());
    Get.lazyPut<GetBookBorrowController>(() => GetBookBorrowController());
    Get.lazyPut<GetAllBookController>(() => GetAllBookController());
    Get.lazyPut<GetBookReview>(() => GetBookReview());
  }
}
