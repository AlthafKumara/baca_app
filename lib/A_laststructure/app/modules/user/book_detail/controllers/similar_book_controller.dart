import 'package:baca_app/A_laststructure/app/data/model/book_model.dart';
import 'package:baca_app/A_laststructure/app/data/services/book_services.dart';
import 'package:get/get.dart';

class SimilarBookController extends GetxController with StateMixin<List<Book>> {
  BookServices bookservices = BookServices();
  var allbooks = <Book>[].obs;
  void getSimilarBook() async {
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
    getSimilarBook();
    super.onInit();
  }
}
