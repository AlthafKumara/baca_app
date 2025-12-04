import 'package:baca_app/app/routes/app_pages.dart';
import 'package:get/get.dart';

class BottomnavController extends GetxController {
  var selectedIndex = 0.obs;

  void changeIndex(int index) {
    selectedIndex.value = index;

    if (index == 0) {
      Get.offNamed(Routes.HOME);
    } else if (index == 1) {
      Get.offNamed(Routes.FEED);
    } else if (index == 2) {
      Get.offNamed(Routes.LIBRARY);
    } else if (index == 3) {
      Get.offNamed(Routes.PROFILE);
    }
  }

  

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  
}
