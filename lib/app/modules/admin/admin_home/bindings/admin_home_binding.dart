import 'package:baca_app/app/modules/admin/admin_home/controllers/top_stats_controller.dart';
import 'package:baca_app/app/modules/notification/controllers/notification_controller.dart';
import 'package:get/get.dart';

import '../controllers/admin_home_controller.dart';

class AdminHomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AdminHomeController>(() => AdminHomeController());
    Get.put(NotificationController(), permanent: true);
    Get.lazyPut<TopStatsController>(() => TopStatsController());
  }
}
