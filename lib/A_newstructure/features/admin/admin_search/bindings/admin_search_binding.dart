import 'package:baca_app/A_newstructure/features/admin/admin_search/controllers/admin_get_book_controller.dart';
import 'package:baca_app/A_newstructure/features/admin/admin_search/controllers/admin_search_controller.dart';
import 'package:get/get.dart';

class AdminSearchBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AdminGetBookController>(() => AdminGetBookController());
    Get.lazyPut<AdminSearchController>(() => AdminSearchController());
  }
}
