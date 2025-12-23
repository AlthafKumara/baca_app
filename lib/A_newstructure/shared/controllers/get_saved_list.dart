import 'package:baca_app/A_newstructure/features/user/user_book_detail/controllers/user_book_detail_controller.dart';
import 'package:baca_app/A_newstructure/shared/models/saved_list_model.dart';
import 'package:baca_app/A_newstructure/shared/repositories/get_book_by_id_repository.dart';
import 'package:baca_app/A_newstructure/shared/repositories/get_saved_list.dart';
import 'package:get/get.dart';

class GetSavedList extends GetxController
    with StateMixin<List<SavedListModel>> {
  // ================= Import ================ //
  final saveListRepo = GetSavedListRepository();
  final bookIdRepo = GetBookByIdRepository();
  final profile = Get.find<UserBookDetailController>();

  // ================= Variable ================ //
  var selectedListId = RxnInt();

  // ================= Function ================ //
  void getSavedList(String userId) async {
    try {
      change(null, status: RxStatus.loading());
      final listbook = await saveListRepo.getSavedList(userId);

      if (listbook.isEmpty) {
        change([], status: RxStatus.empty());
      } else {
        for (var list in listbook) {
          if (list.bookId != null) {
            list.books = (await bookIdRepo.getBookById([list.bookId!])).first;
          }
        }

        change(listbook, status: RxStatus.success());
      }
    } catch (e) {
      change(null, status: RxStatus.error(e.toString()));
    }
  }
}
