import 'package:baca_app/A_laststructure/app/core/widget/snackbar.dart';
import 'package:baca_app/A_laststructure/app/data/model/saved_list_model.dart';
import 'package:baca_app/A_laststructure/app/data/services/book_services.dart';
import 'package:baca_app/A_laststructure/app/data/services/saved_list_services.dart';
import 'package:baca_app/A_laststructure/app/modules/user/book_detail/controllers/book_detail_controller.dart';
import 'package:baca_app/A_laststructure/app/routes/app_pages.dart';
import 'package:get/get.dart';

class SavedController extends GetxController
    with StateMixin<List<SavedListModel>> {
  final SavedListServices savedlistservices = SavedListServices();
  final BookServices bookServices = BookServices();
  final profile = Get.find<BookDetailController>();

  var selectedListId = RxnInt();

  @override
  void onInit() {
    super.onInit();
    ever(profile.profile, (profile) {
      print(profile);
      if (profile != null) {
        getSavedList(profile.id);
      }
    });
  }

  void getSavedList(String userId) async {
    try {
      change(null, status: RxStatus.loading());
      final listbook = await savedlistservices.getSavedList(userId);

      if (listbook.isEmpty) {
        change([], status: RxStatus.empty());
      } else {
        for (var list in listbook) {
          if (list.bookId != null) {
            list.books = (await bookServices.getBookById([list.bookId!])).first;
          }
        }

        change(listbook, status: RxStatus.success());
      }
    } catch (e) {
      change(null, status: RxStatus.error(e.toString()));
    }
  }

  void handleAddBook({required int listId, required int bookId}) async {
    try {
      await savedlistservices.addBookList(listId: listId, bookId: bookId);

      print("Berhasil Update");
      CustomSnackbar.succesSnackbar("Book successfully added to saved list");

      Get.offAllNamed(Routes.LIBRARY);
    } catch (e) {
      CustomSnackbar.failedSnackbar(e.toString());
    }
  }
}
