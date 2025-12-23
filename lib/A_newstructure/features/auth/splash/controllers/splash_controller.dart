import 'package:baca_app/A_newstructure/configs/routes/route.dart';
import 'package:get/get.dart';

class SplashController extends GetxController {
  // ==============FUNCTIONS==================
  void duration() {
    print('DURATION START');
    Future.delayed(const Duration(seconds: 3), () {
      print('TRY NAVIGATE');
      toOnboarding();
    });
  }

  // ===============Navigation================
  void toOnboarding() => Get.offNamed(Routes.ONBOARDING);

  @override
  void onInit() {
    super.onInit();
    print('SPLASH onReady CALLED');
    duration();
  }

  @override
  void onReady() {
    super.onReady();
  }
}
