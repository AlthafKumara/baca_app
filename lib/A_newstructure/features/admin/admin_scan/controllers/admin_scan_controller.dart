import 'package:baca_app/A_newstructure/configs/routes/route.dart';
import 'package:baca_app/A_newstructure/shared/repositories/get_book_by_id_repository.dart';
import 'package:baca_app/A_newstructure/shared/repositories/get_borrow_by_id_repository.dart';
import 'package:baca_app/A_newstructure/shared/widgets/snackbar.dart';
import 'package:baca_app/A_newstructure/utils/enums/status_enum.dart';
import 'package:get/get.dart';

class AdminScanController extends GetxController {
  final borrowRepo = GetBorrowByIdRepository();
  final bookRepo = GetBookByIdRepository();
  void handleQRCode(String code) async {
    if (!code.startsWith("BORROW-")) {
      Get.snackbar("Invalid QR", "This QR is not Borrow QR");
      return;
    }

    final parts = code.split("-");

    if (parts.length < 7) {
      CustomSnackbar.failedSnackbar("QR format incorrect");
      return;
    }

    final borrowId = int.tryParse(parts[1]) ?? 0;

    final userId = "${parts[2]}-${parts[3]}-${parts[4]}-${parts[5]}";

    final bookId = int.tryParse(parts.last) ?? 0;

    final borrow = await borrowRepo.getBookBorrowById(borrowId);
    final books = await bookRepo.getBookById([borrow.bookId]);
    final book = books.first;

    for (var book in books) {
      if (book.id == borrow.bookId) {
        borrow.book = book;
        break;
      }
    }

    final status = switch (borrow.status) {
      Status.pending => "Pending",
      Status.onBorrow => "On Borrow",
      Status.returned => "Returned",
      Status.rejected => "Rejected",
    };

    Get.toNamed(
      Routes.ADMIN_BOOK_BORROW_DETAIL,
      arguments: {"borrow": borrow, "status": status},
    );
  }

  @override
  void onInit() {
    super.onInit();
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
