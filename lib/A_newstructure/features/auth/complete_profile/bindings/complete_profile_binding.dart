import 'package:baca_app/A_newstructure/features/auth/complete_profile/controllers/complete_profile_controller.dart';
import 'package:get/get.dart';

class CompleteProfileBinding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut(() => CompleteProfileController());
  }
}