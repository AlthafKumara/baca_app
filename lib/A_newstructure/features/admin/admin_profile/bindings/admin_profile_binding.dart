import 'package:baca_app/A_newstructure/features/admin/admin_profile/controllers/admin_profile_controller.dart';
import 'package:baca_app/A_newstructure/shared/controllers/auth_controller.dart';
import 'package:baca_app/A_newstructure/shared/controllers/get_profile_controller.dart';
import 'package:get/get.dart';

class AdminProfileBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ProfileController>(() => ProfileController());
    Get.lazyPut<AuthController>(() => AuthController());
    Get.lazyPut<AdminProfileController>(() => AdminProfileController());
  }
}
