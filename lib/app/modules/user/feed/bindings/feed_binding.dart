import 'package:get/get.dart';

import 'package:baca_app/app/modules/user/feed/controllers/form_feed_controller.dart';
import 'package:baca_app/app/modules/user/feed/controllers/get_book_feed_controller.dart';
import 'package:baca_app/app/modules/user/feed/controllers/get_feed_controller.dart';
import 'package:baca_app/app/modules/user/home/controllers/bottomnav_controller.dart';

import '../controllers/feed_controller.dart';

class FeedBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<GetFeedController>(
      () => GetFeedController(),
    );
    Get.lazyPut<GetBookFeedController>(
      () => GetBookFeedController(),
    );
    Get.lazyPut<FormFeedController>(
      () => FormFeedController(),
    );
    Get.lazyPut<FeedController>(() => FeedController());
    Get.lazyPut<BottomnavController>(() => BottomnavController());
  }
}
