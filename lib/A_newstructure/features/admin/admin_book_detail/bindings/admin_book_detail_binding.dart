import 'package:baca_app/A_newstructure/shared/controllers/delete_book_controller.dart';
import 'package:baca_app/A_newstructure/features/user/user_book_detail/controllers/get_category_book_controller.dart';
import 'package:baca_app/A_newstructure/shared/controllers/book_category_controller.dart';
import 'package:get/get.dart';

class AdminBookDetailBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<GetCategoryBookController>(() => GetCategoryBookController());
    Get.lazyPut<DeleteBookController>(() => DeleteBookController());
    Get.lazyPut<BookCatagoryController>(() => BookCatagoryController());
  }
}
