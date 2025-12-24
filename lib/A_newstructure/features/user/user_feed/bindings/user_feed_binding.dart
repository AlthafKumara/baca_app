import 'package:baca_app/A_newstructure/features/user/user_feed/controllers/get_book_feed_controller.dart';
import 'package:baca_app/A_newstructure/features/user/user_feed/controllers/get_feed_controller.dart';
import 'package:baca_app/A_newstructure/features/user/user_feed/controllers/user_feed_controller.dart';
import 'package:baca_app/A_newstructure/features/user/user_feed/controllers/user_form_feed_controller.dart';
import 'package:baca_app/A_newstructure/shared/controllers/get_all_book_controller.dart';
import 'package:get/get.dart';

class UserFeedBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<GetBookFeedController>(() => GetBookFeedController());
    Get.lazyPut<GetFeedController>(() => GetFeedController());
    Get.lazyPut<UserFeedController>(() => UserFeedController());
    Get.lazyPut<UserFormFeedController>(() => UserFormFeedController());
  }
}
