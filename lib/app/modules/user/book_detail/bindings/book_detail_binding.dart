import 'package:baca_app/app/modules/user/book_detail/controllers/book_category_controller.dart';
import 'package:baca_app/app/modules/user/book_detail/controllers/saved_list_controller.dart';
import 'package:baca_app/app/modules/user/book_detail/controllers/similar_book_controller.dart';
import 'package:baca_app/app/modules/user/library/controllers/library_controller.dart';

import 'package:get/get.dart';

import '../controllers/book_detail_controller.dart';

class BookDetailBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<BookDetailController>(() => BookDetailController());

    Get.lazyPut<BookCategoryController>(() => BookCategoryController());

    Get.lazyPut<SimilarBookController>(() => SimilarBookController());

    Get.lazyPut<SavedController>(() => SavedController());
    Get.lazyPut<LibraryController>(() => LibraryController());
  }
}
