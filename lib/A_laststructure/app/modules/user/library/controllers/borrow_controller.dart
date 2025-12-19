import 'package:baca_app/A_laststructure/app/data/model/borrow_model.dart';
import 'package:baca_app/A_laststructure/app/data/services/book_services.dart';
import 'package:baca_app/A_laststructure/app/data/services/borrow_services.dart';
import 'package:baca_app/A_laststructure/app/modules/user/library/controllers/library_controller.dart';
import 'package:get/get.dart';

class BorrowController extends GetxController with StateMixin<List<Borrow>> {
  final borrowServices = BorrowServices();
  final bookServices = BookServices();

  final profileC = Get.find<LibraryController>();

  var listBorrow = <Borrow>[].obs;

  void getBorrowByUserId() async {
    final userId = profileC.profile.value!.id;
    change(null, status: RxStatus.loading());
    try {
      final borrows = await borrowServices.getBookBorrowByUser(userId);

      if (borrows.isEmpty) {
        listBorrow.clear();
        change([], status: RxStatus.empty());
      }

      final bookIds = borrows.map((e) => e.bookId).toList();

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
      change(null, status: RxStatus.error(e.toString()));
    }
  }

  @override
  void onInit() async {
    super.onInit();
    getBorrowByUserId();
  }
}
