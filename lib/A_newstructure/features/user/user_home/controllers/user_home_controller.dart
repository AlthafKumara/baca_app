import 'package:baca_app/A_newstructure/configs/routes/route.dart';
import 'package:baca_app/A_newstructure/shared/models/book_model.dart';
import 'package:get/get.dart';

class UserHomeController extends GetxController {
  // ============== NAVIGATOR ============== //
  void toBookDetail({required BookModel book}) =>
      Get.toNamed(Routes.USER_BOOK_DETAIL, arguments: book);
}
