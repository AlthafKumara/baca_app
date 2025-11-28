import 'package:baca_app/app/modules/auth/controllers/splash_controller.dart';
import 'package:get/get.dart';

import '../controllers/auth_controller.dart';

class AuthBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AuthController>(() => AuthController());
    Get.lazyPut<SplashController>(() => SplashController());
  }
}
