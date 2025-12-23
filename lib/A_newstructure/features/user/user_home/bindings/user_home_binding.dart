import 'package:baca_app/A_newstructure/features/user/user_home/controllers/user_home_controller.dart';
import 'package:baca_app/A_newstructure/shared/controllers/get_all_book_controller.dart';
import 'package:get/get.dart';

class UserHomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<GetAllBookController>(() => GetAllBookController());
    Get.lazyPut<UserHomeController>(() => UserHomeController());
  }
}
