import 'package:get/get.dart';

import 'package:baca_app/app/modules/admin/admin_library/controllers/book_catagory_controller.dart';
import 'package:baca_app/app/modules/admin/admin_library/controllers/chip_controller.dart';
import 'package:baca_app/app/modules/admin/admin_library/controllers/form_controller_controller.dart';
import 'package:baca_app/app/modules/admin/admin_library/controllers/tab_page_controller.dart';

import '../controllers/admin_library_controller.dart';

class AdminLibraryBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<FormControllerController>(
      () => FormControllerController(),
    );
    Get.lazyPut<BookCatagoryController>(
      () => BookCatagoryController(),
    );
    Get.lazyPut<ChipController>(
      () => ChipController(),
    );
    Get.lazyPut<TabPageController>(
      () => TabPageController(),
    );
    Get.lazyPut<AdminLibraryController>(
      () => AdminLibraryController(),
    );
  }
}
