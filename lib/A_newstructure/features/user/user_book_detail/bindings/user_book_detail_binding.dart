import 'package:baca_app/A_newstructure/features/user/user_book_detail/controllers/get_category_book_controller.dart';
import 'package:baca_app/A_newstructure/features/user/user_book_detail/controllers/handle_borrow_controller.dart';
import 'package:baca_app/A_newstructure/features/user/user_book_detail/controllers/handle_saved_list_controller.dart';
import 'package:baca_app/A_newstructure/features/user/user_book_detail/controllers/user_book_detail_controller.dart';
import 'package:baca_app/A_newstructure/shared/controllers/get_all_book_controller.dart';
import 'package:baca_app/A_newstructure/shared/controllers/get_book_review.dart';
import 'package:baca_app/A_newstructure/shared/controllers/get_saved_list.dart';
import 'package:get/get.dart';

class UserBookDetailBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<GetBookReview>(() => GetBookReview());
    Get.lazyPut<GetSavedList>(() => GetSavedList());
    Get.lazyPut<GetCategoryBookController>(() => GetCategoryBookController());
    Get.lazyPut<HandleBorrowController>(() => HandleBorrowController());
    Get.lazyPut<UserBookDetailController>(() => UserBookDetailController());
    Get.lazyPut<GetAllBookController>(() => GetAllBookController());
    Get.lazyPut<HandleSavedListController>(() => HandleSavedListController());
    
  }
}
