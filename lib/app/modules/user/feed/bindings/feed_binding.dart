import 'package:baca_app/app/modules/user/home/controllers/bottomnav_controller.dart';
import 'package:get/get.dart';

import '../controllers/feed_controller.dart';

class FeedBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<FeedController>(() => FeedController());
    Get.lazyPut<BottomnavController>(() => BottomnavController());
  }
}
