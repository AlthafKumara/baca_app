import 'package:baca_app/app/modules/notification/controllers/notification_controller.dart';
import 'package:get/get.dart';

import 'package:baca_app/app/modules/user/home/controllers/book_controller.dart';
import 'package:baca_app/app/modules/user/home/controllers/bottomnav_controller.dart';

import '../controllers/home_controller.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<BookController>(
      () => BookController(),
    );
    Get.lazyPut<BottomnavController>(
      () => BottomnavController(),
    );
    Get.lazyPut<HomeController>(
      () => HomeController(),
    );
    Get.put(NotificationController(), permanent: true);
  }
}
