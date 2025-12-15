import 'package:baca_app/app/modules/admin/admin_library/controllers/admin_get_review_controller.dart';
import 'package:baca_app/app/modules/admin/admin_library/controllers/borrow_controller.dart';
import 'package:get/get.dart';

import 'package:baca_app/app/modules/admin/admin_library/controllers/book_catagory_controller.dart';
import 'package:baca_app/app/modules/admin/admin_library/controllers/book_controller.dart';
import 'package:baca_app/app/modules/admin/admin_library/controllers/card_controller.dart';
import 'package:baca_app/app/modules/admin/admin_library/controllers/chip_controller.dart';
import 'package:baca_app/app/modules/admin/admin_library/controllers/form_controller_controller.dart';
import 'package:baca_app/app/modules/admin/admin_library/controllers/tab_page_controller.dart';

import '../controllers/admin_library_controller.dart';

class AdminLibraryBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<CardController>(() => CardController());
    Get.lazyPut<BookController>(() => BookController());
    Get.lazyPut<FormControllerController>(() => FormControllerController());
    Get.lazyPut<BookCatagoryController>(() => BookCatagoryController());
    Get.lazyPut<ChipController>(() => ChipController());
    Get.put<TabPageController>(TabPageController(), permanent: true);
    Get.lazyPut<AdminLibraryController>(() => AdminLibraryController());
    Get.lazyPut<BorrowController>(() => BorrowController());
    Get.lazyPut<AdminGetReviewcontroller>(() => AdminGetReviewcontroller());
  }
}
