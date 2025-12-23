import 'package:baca_app/A_newstructure/configs/routes/route.dart';
import 'package:get/get.dart';

class UserNavbarController {
  var selectedIndex = 0.obs;

  void changeIndex(int index) {
    selectedIndex.value = index;

    if (index == 0) {
      Get.offNamed(Routes.USER_HOME);
    } else if (index == 1) {
      Get.offNamed(Routes.USER_FEED);
    } else if (index == 2) {
      Get.offNamed(Routes.USER_LIBRARY);
    } else if (index == 3) {
      Get.offNamed(Routes.USER_PROFILE);
    }
  }
}
