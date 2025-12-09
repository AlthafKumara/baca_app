import 'package:baca_app/app/data/model/book_category.dart';
import 'package:baca_app/app/data/services/book_category_services.dart';
import 'package:get/get.dart';

class BookCategoryController extends GetxController
    with StateMixin<BookCategory> {
  final services = BookCategoryServices();
  Rxn<BookCategory> category = Rxn<BookCategory>();
  void getBookCategoryById(int id) async {
    try {
      change(null, status: RxStatus.loading());
      final result = await services.getCategoryBookById(id);
      category.value = result;

      change(result, status: RxStatus.success());
    } catch (e) {
      change(null, status: RxStatus.error(e.toString()));
    }
  }
}
