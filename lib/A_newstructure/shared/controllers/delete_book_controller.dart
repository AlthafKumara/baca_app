import 'package:baca_app/A_newstructure/shared/repositories/delete_book_repository.dart';
import 'package:baca_app/A_newstructure/shared/widgets/snackbar.dart';
import 'package:get/get.dart';

class DeleteBookController extends GetxController {
  final bookRepo = DeleteBookRepository();
  Future<void> deleteSelectBooks(List<int> bookids) async {
    try {
      await bookRepo.deleteListBook(bookids);
      CustomSnackbar.succesSnackbar("Book successfully deleted");
    } catch (e) {
      CustomSnackbar.failedSnackbar("Failed to delete book: $e");
    }
  }
}
