import 'package:baca_app/app/data/model/book_model.dart';
import 'package:baca_app/app/data/services/book_services.dart';
import 'package:get/get.dart';

class BookController extends GetxController with StateMixin<List<Book>> {
  BookServices bookservices = BookServices();
  var allbooks = <Book>[].obs;
  void getAllBook() async {
    try {
      change(null, status: RxStatus.loading());
      final listbook = await bookservices.getBook();
      allbooks.assignAll(listbook);

      change(listbook, status: RxStatus.success());
    } catch (e) {
      change(null, status: RxStatus.error(e.toString()));
    }
  }

  @override
  void onInit() {
    super.onInit();
    getAllBook();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }
}
