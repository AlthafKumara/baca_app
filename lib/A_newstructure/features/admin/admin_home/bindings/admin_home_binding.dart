import 'package:baca_app/A_newstructure/features/admin/admin_home/controllers/admin_home_controller.dart';
import 'package:baca_app/A_newstructure/features/admin/admin_home/controllers/admin_top_stats_controller.dart';
import 'package:get/get.dart';

class AdminHomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AdminHomeController>(() => AdminHomeController());
    Get.lazyPut<AdminTopStatsController>(() => AdminTopStatsController());
  }
}
