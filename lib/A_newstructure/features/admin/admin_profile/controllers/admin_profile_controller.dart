import 'package:baca_app/A_newstructure/configs/routes/route.dart';
import 'package:baca_app/A_newstructure/shared/models/profile_model.dart';
import 'package:get/get.dart';

class AdminProfileController extends GetxController {
  // ============= Navigation ============= //

  void toAccountSetting({ProfileModel? profile}) =>
      Get.toNamed(Routes.ADMIN_ACCOUNT_SETTING, arguments: profile);

  void toPersonalDetail({ProfileModel? profile}) =>
      Get.toNamed(Routes.ADMIN_PERSONAL_DETAIL, arguments: profile);
  void toNotification() => Get.toNamed(Routes.NOTIFICATION);

  void toChangeAuth({ProfileModel? profile}) =>
      Get.toNamed(Routes.ADMIN_CHANGE_AUTH, arguments: profile);
}
