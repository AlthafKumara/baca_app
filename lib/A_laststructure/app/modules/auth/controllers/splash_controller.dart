import 'package:baca_app/A_laststructure/app/routes/app_pages.dart';
import 'package:get/get.dart';

class SplashController extends GetxController {
  void duration() {
    Future.delayed(const Duration(seconds: 3), () {
      Get.offNamed(Routes.ONBOARDING);
    });
  }

  @override
  void onInit() {
    super.onInit();
    duration();
  }
}
