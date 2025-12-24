import 'package:baca_app/A_newstructure/features/admin/admin_borrow_detail/controllers/update_borrow_controller.dart';
import 'package:get/get.dart';

class AdminBorrowDetailBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<UpdateBorrowController>(() => UpdateBorrowController());
  }
}
