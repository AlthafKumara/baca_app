import 'package:baca_app/A_newstructure/features/user/user_search/controllers/user_search_book_controller.dart';
import 'package:baca_app/A_newstructure/features/user/user_search/controllers/user_search_page_controller.dart';
import 'package:baca_app/A_newstructure/shared/controllers/get_all_book_controller.dart';
import 'package:get/get.dart';

class UserSearchBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<UserSearchPageController>(() => UserSearchPageController());
    Get.lazyPut<UserSearchBookController>(() => UserSearchBookController());
  }
}
