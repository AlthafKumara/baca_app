import 'package:baca_app/app/modules/user/library/controllers/borrow_controller.dart';
import 'package:baca_app/app/modules/user/library/controllers/chip_controller.dart';
import 'package:baca_app/app/modules/user/library/controllers/saved_list_controller.dart';
import 'package:get/get.dart';

import 'package:baca_app/app/modules/user/home/controllers/bottomnav_controller.dart';

import '../controllers/library_controller.dart';

class LibraryBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ChipController>(() => ChipController());
    Get.lazyPut<LibraryController>(() => LibraryController());
    Get.lazyPut<BottomnavController>(() => BottomnavController());
    Get.lazyPut<SavedListController>(() => SavedListController());
    Get.lazyPut<BorrowController>(() => BorrowController());
  }
}
