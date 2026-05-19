import 'package:baca_app/A_newstructure/shared/models/borrow_model.dart';
import 'package:baca_app/A_newstructure/shared/repositories/get_book_borrow_by_id_repository.dart';
import 'package:baca_app/A_newstructure/shared/repositories/get_book_by_id_repository.dart';
import 'package:baca_app/A_newstructure/utils/enums/status_enum.dart';
import 'package:get/get.dart';

class GetBookBorrowByIdController extends GetxController
    with StateMixin<BorrowModel> {
  GetBookBorrowByIdController({required this.borrowId});
  final int borrowId;
  final borrowBookByIdRepo = GetBookBorrowByIdRepository();
  final getBookByIdRepo = GetBookByIdRepository();
  var borrowData = Rxn<BorrowModel>();
  var borrowStatus = Status.pending.obs;
  Future<void> getBookBorrowed() async {
    change(null, status: RxStatus.loading());

    try {
      final borrows = await borrowBookByIdRepo.getBookBorrowById(borrowId);

      borrowStatus.value = borrows.status;
      final bookId = borrows.bookId;

      final books = await getBookByIdRepo.getBookById([bookId]);
      final bookMap = {for (var b in books) b.id: b};
      if (bookMap.containsKey(borrows.bookId)) {
        borrows.book = bookMap[borrows.bookId];
      }

      change(borrows, status: RxStatus.success());
      borrowData.value = borrows;
    } catch (e) {
      print("ERROR getBookBorrowed: $e");
      change(null, status: RxStatus.error(e.toString()));
    }
  }

  @override
  void onInit() {
    getBookBorrowed();
    super.onInit();
  }
}
