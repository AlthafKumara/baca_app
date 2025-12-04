import 'package:baca_app/app/modules/user/home/controllers/bottomnav_controller.dart';
import 'package:get/get.dart';

import '../controllers/profile_controller.dart';

class ProfileBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ProfileController>(() => ProfileController());
    Get.lazyPut<BottomnavController>(() => BottomnavController());
  }
}
