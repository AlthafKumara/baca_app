import 'package:baca_app/app/modules/user/home/controllers/bottomnav_controller.dart';
import 'package:get/get.dart';

import '../controllers/library_controller.dart';

class LibraryBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<LibraryController>(
      () => LibraryController(),
    );
    Get.lazyPut<BottomnavController>(
      () => BottomnavController(),
    );
  }
}
