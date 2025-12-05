import 'package:baca_app/app/modules/auth/controllers/auth_controller.dart';
import 'package:get/get.dart';

import '../controllers/admin_profile_controller.dart';

class AdminProfileBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AuthController>(() => AuthController());

    Get.lazyPut<AdminProfileController>(() => AdminProfileController());
  }
}
