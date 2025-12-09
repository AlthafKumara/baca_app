import 'package:baca_app/app/core/widget/snackbar.dart';
import 'package:baca_app/app/data/model/book_model.dart';
import 'package:baca_app/app/data/services/book_services.dart';
import 'package:get/get.dart';

class BookController extends GetxController {
  BookServices bookServices = BookServices();

  var books = <Book>[].obs;
  var booksBorrowed = <Book>[].obs;

  var isLoading = false.obs;

  void getBook() async {
    isLoading.value = true;
    try {
      final result = await bookServices.getBook();

      books.assignAll(result);
    } catch (e) {
      print(e);
    } finally {
      isLoading.value = false;
    }
  }

  void getBookBorrowed() async {
    isLoading.value = true;
    try {
      final result = await bookServices.getBookFilterStatus();
      booksBorrowed.assignAll(result);
    } catch (e) {
      print(e);
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> deleteSelectBooks(List<int> bookids) async {
    try {
      await bookServices.deleteListBook(bookids);
      CustomSnackbar.succesSnackbar("Book successfully deleted");
      getBook();
    } catch (e) {
      CustomSnackbar.failedSnackbar("Failed to delete book: $e");
    }
  }

  @override
  void onInit() {
    super.onInit();
    getBook();
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
