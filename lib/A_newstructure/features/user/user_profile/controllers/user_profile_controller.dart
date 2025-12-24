import 'package:baca_app/A_newstructure/configs/routes/route.dart';
import 'package:baca_app/A_newstructure/shared/models/profile_model.dart';
import 'package:get/get.dart';

class UserProfileController {
  // =============== Navigation =============== //
  // void toNotification () => Get.toNamed(Routes.NOTIFICATION);

  void toAccountSetting({ProfileModel? profile}) =>
      Get.toNamed(Routes.USER_ACCOUNT_SETTING, arguments: profile);

  void toPersonalDetail({ProfileModel? profile}) =>
      Get.toNamed(Routes.USER_PERSONAL_DETAIL, arguments: profile);
  void toNotification() => Get.toNamed(Routes.NOTIFICATION);
}
