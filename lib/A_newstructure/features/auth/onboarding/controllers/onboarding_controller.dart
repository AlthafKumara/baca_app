import 'package:baca_app/A_newstructure/configs/routes/route.dart';
import 'package:get/get.dart';

class OnboardingController extends GetxController {
  // --------------------------- NAVIGATOR -------------------------------------
  void toLogin() => Get.toNamed(Routes.LOGIN);
  void toRegister() => Get.toNamed(Routes.REGISTER);
}
