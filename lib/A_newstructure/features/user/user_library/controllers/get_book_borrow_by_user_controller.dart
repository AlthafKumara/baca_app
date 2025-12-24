import 'package:baca_app/A_newstructure/features/user/user_library/controllers/user_library_controller.dart';
import 'package:baca_app/A_newstructure/features/user/user_library/repositories/get_book_borrow_by_user_repository.dart';
import 'package:baca_app/A_newstructure/shared/models/borrow_model.dart';
import 'package:baca_app/A_newstructure/shared/repositories/get_book_by_id_repository.dart';
import 'package:get/get.dart';

class GetBookBorrowByUserController extends GetxController
    with StateMixin<List<BorrowModel>> {
  // ============== Import ================
  final borrowRepo = GetBookBorrowByUserRepository();
  final bookRepo = GetBookByIdRepository();

  final profileC = Get.find<UserLibraryController>();
  // ============== Variable ================

  var listBorrow = <BorrowModel>[].obs;
  // =============== Function ================

  void getBorrowByUserId() async {
    final userId = profileC.profile.value!.id;
    change(null, status: RxStatus.loading());
    try {
      final borrows = await borrowRepo.getBookBorrowByUser(userId);

      if (borrows.isEmpty) {
        listBorrow.clear();
        change([], status: RxStatus.empty());
      }

      final bookIds = borrows.map((e) => e.bookId).toList();

      final books = await bookRepo.getBookById(bookIds);
      final bookMap = {for (var b in books) b.id: b};
      for (var borrow in borrows) {
        if (bookMap.containsKey(borrow.bookId)) {
          borrow.book = bookMap[borrow.bookId];
        }
      }
      listBorrow.assignAll(borrows);
      change(borrows, status: RxStatus.success());
    } catch (e) {
      change(null, status: RxStatus.error(e.toString()));
    }
  }

  @override
  void onInit() async {
    super.onInit();
    getBorrowByUserId();
  }
}
