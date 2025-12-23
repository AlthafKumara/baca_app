import 'package:baca_app/A_newstructure/configs/routes/route.dart';
import 'package:baca_app/A_newstructure/features/user/user_book_detail/repositories/add_book_list.dart';
import 'package:baca_app/A_newstructure/shared/widgets/snackbar.dart';
import 'package:get/get.dart';

class HandleSavedListController {
  // =============================== Import ===============================
  final savedListRepo = AddBookList();

  // =============================== Function ===============================
  void handleAddBook({required int listId, required int bookId}) async {
    try {
      await savedListRepo.addBookList(listId: listId, bookId: bookId);

      print("Berhasil Update");
      CustomSnackbar.succesSnackbar("Book successfully added to saved list");

      toUserLibrary();
    } catch (e) {
      CustomSnackbar.failedSnackbar(e.toString());
    }
  }

  // =============================== Navigation ===============================
  void toUserLibrary() => Get.offAllNamed(Routes.USER_LIBRARY);
}
