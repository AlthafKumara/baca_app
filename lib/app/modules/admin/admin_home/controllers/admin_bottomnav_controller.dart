import 'package:baca_app/app/routes/app_pages.dart';
import 'package:get/get.dart';

class AdminBottomnavController extends GetxController {
  var selectedIndex = 0.obs;

  void changeIndex(int index) {
    selectedIndex.value = index;

    if (index == 0) {
      Get.offNamed(Routes.ADMIN_HOME);
    } else if (index == 1) {
      Get.offNamed(Routes.ADMIN_LIBRARY);
    } else if (index == 2) {
      Get.offNamed(Routes.ADMIN_PROFILE);
    } 
  }
}
