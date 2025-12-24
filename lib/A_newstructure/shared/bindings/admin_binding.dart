import 'package:baca_app/A_newstructure/features/notification/controllers/notification_controller.dart';
import 'package:baca_app/A_newstructure/shared/controllers/admin_navbar_controller.dart';
import 'package:get/get.dart';

class AdminBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AdminNavbarController>(() => AdminNavbarController());
     Get.put(NotificationController(), permanent: true);
  }
}
