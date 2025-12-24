import 'package:baca_app/A_newstructure/features/admin/admin_scan/controllers/admin_scan_controller.dart';
import 'package:get/get.dart';

class AdminScanBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AdminScanController>(() => AdminScanController());
  }
}
