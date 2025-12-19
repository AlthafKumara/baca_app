import 'package:baca_app/A_laststructure/app/modules/admin/admin_search/controllers/admin_get_book_controller.dart';
import 'package:get/get.dart';

import '../controllers/admin_search_controller.dart';

class AdminSearchBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AdminSearchController>(() => AdminSearchController());
    Get.lazyPut<AdminGetBookController>(() => AdminGetBookController());
  }
}
