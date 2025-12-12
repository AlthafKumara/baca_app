import 'package:baca_app/app/core/widget/snackbar.dart';
import 'package:baca_app/app/data/model/borrow_model.dart';
import 'package:baca_app/app/data/services/book_services.dart';
import 'package:baca_app/app/data/services/borrow_services.dart';
import 'package:baca_app/app/routes/app_pages.dart';
import 'package:get/get.dart';

class AdminScanController extends GetxController {
  BorrowServices borrowServices = BorrowServices();
  BookServices bookServices = BookServices();
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

    final borrow = await borrowServices.getBookBorrowById(borrowId);
    final books = await bookServices.getBookById([borrow.bookId]);
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
