import 'package:baca_app/A_newstructure/shared/models/borrow_model.dart';
import 'package:baca_app/A_newstructure/shared/repositories/get_all_book_repository.dart';
import 'package:baca_app/A_newstructure/shared/repositories/get_all_borrow_repository.dart';
import 'package:baca_app/A_newstructure/shared/repositories/get_book_by_id_repository.dart';
import 'package:get/get.dart';

class GetBookBorrowController extends GetxController
    with StateMixin<List<BorrowModel>> {
  final borrowServices = GetAllBorrowRepository();
  final bookServices = GetBookByIdRepository();
  var listBorrow = <BorrowModel>[].obs;
  void getBookBorrowed() async {
    change(null, status: RxStatus.loading());

    try {
      final borrows = await borrowServices.getBookBorrow();
      print("Borrows fetched: $borrows");

      if (borrows.isEmpty) {
        listBorrow.clear();
        change([], status: RxStatus.empty());
        return;
      }
      final bookIds = borrows.map((e) => e.bookId).toList();

      if (bookIds.isEmpty) {
        listBorrow.clear();
        change([], status: RxStatus.empty());
        return;
      }
      final books = await bookServices.getBookById(bookIds);
      final bookMap = {for (var b in books) b.id: b};
      for (var borrow in borrows) {
        if (bookMap.containsKey(borrow.bookId)) {
          borrow.book = bookMap[borrow.bookId];
        }
      }
      listBorrow.assignAll(borrows);
      change(borrows, status: RxStatus.success());
    } catch (e) {
      print("ERROR getBookBorrowed: $e");
      change([], status: RxStatus.error(e.toString()));
    }
  }

  @override
  void onInit() {
    getBookBorrowed();
    super.onInit();
  }
}
