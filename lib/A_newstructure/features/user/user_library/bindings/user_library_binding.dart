import 'package:baca_app/A_newstructure/features/user/user_library/controllers/get_book_borrow_by_user_controller.dart';
import 'package:baca_app/A_newstructure/features/user/user_library/controllers/user_library_controller.dart';
import 'package:baca_app/A_newstructure/features/user/user_library/controllers/user_library_saved_list_controller.dart';
import 'package:baca_app/A_newstructure/shared/controllers/chip_controller.dart';
import 'package:baca_app/A_newstructure/shared/controllers/get_all_book_controller.dart';
import 'package:get/get.dart';

class UserLibraryBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ChipController>(() => ChipController());
    Get.lazyPut<UserLibraryController>(() => UserLibraryController());
    Get.lazyPut<UserLibrarySavedListController>(
      () => UserLibrarySavedListController(),
    );
    Get.lazyPut<GetBookBorrowByUserController>(
      () => GetBookBorrowByUserController(),
    );
  }
}
