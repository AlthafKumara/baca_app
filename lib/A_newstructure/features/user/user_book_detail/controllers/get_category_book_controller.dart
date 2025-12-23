import 'package:baca_app/A_newstructure/features/user/user_book_detail/repositories/get_category_book.dart';
import 'package:baca_app/A_newstructure/shared/models/book_category_model.dart';
import 'package:get/get.dart';

class GetCategoryBookController extends GetxController
    with StateMixin<BookCategoryModel> {
  final categoryRepository = GetCategoryBookRepository();
  Rxn<BookCategoryModel> category = Rxn<BookCategoryModel>();
  void getBookCategoryById(int id) async {
    try {
      change(null, status: RxStatus.loading());
      final result = await categoryRepository.getCategoryBookById(id);
      category.value = result;

      change(result, status: RxStatus.success());
    } catch (e) {
      change(null, status: RxStatus.error(e.toString()));
    }
  }
}
