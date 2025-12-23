import 'package:baca_app/A_newstructure/shared/models/book_model.dart';
import 'package:baca_app/A_newstructure/shared/repositories/get_all_book_repository.dart';
import 'package:get/get.dart';

class GetAllBookController extends GetxController
    with StateMixin<List<BookModel>> {
  final getAllBookRepository = GetAllBookRepository();

  var allbooks = <BookModel>[].obs;
  void getAllBook() async {
    try {
      change(null, status: RxStatus.loading());
      final listbook = await getAllBookRepository.getBook();
      allbooks.assignAll(listbook);

      change(listbook, status: RxStatus.success());
    } catch (e) {
      change(null, status: RxStatus.error(e.toString()));
    }
  }

  @override
  void onInit() {
    getAllBook();
    super.onInit();
  }
}
