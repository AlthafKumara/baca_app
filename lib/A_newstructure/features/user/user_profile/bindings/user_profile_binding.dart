import 'package:baca_app/A_newstructure/features/user/user_profile/controllers/user_profile_controller.dart';
import 'package:baca_app/A_newstructure/shared/controllers/auth_controller.dart';
import 'package:baca_app/A_newstructure/shared/controllers/get_all_book_controller.dart';
import 'package:baca_app/A_newstructure/shared/controllers/get_profile_controller.dart';
import 'package:get/get.dart';

class UserProfileBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ProfileController>(() => ProfileController());
    Get.lazyPut<AuthController>(() => AuthController());
    Get.lazyPut<UserProfileController>(() => UserProfileController());
  }
}
