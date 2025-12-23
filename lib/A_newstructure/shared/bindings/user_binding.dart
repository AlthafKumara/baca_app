import 'package:baca_app/A_newstructure/shared/controllers/user_navbar_controller.dart';
import 'package:get/get.dart';

class UserBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(UserNavbarController());
  }
}
