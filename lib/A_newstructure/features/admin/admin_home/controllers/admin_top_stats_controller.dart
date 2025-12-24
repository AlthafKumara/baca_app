import 'package:baca_app/A_newstructure/shared/repositories/get_all_book_repository.dart';
import 'package:baca_app/A_newstructure/shared/repositories/get_all_borrow_repository.dart';
import 'package:baca_app/A_newstructure/shared/styles/app_color.dart';
import 'package:baca_app/A_newstructure/utils/enums/status_enum.dart';
import 'package:get/get.dart';

class AdminTopStatsController extends GetxController {
  final borrowServices = GetAllBorrowRepository();
  final bookServices = GetAllBookRepository();

  final totalBooks = 0.obs;
  final availableBooks = 0.obs;
  final borrowedBooks = 0.obs;
  final borrowRequests = 0.obs;

  final stats = <Map<String, dynamic>>[].obs;

  @override
  void onInit() {
    super.onInit();
    loadStats();
  }

  Future<void> loadStats() async {
    final books = await bookServices.getBook();
    final borrows = await borrowServices.getBookBorrow();

    /// TOTAL STOK BUKU
    totalBooks.value = books.fold(0, (sum, book) => sum + book.stock);

    /// JUMLAH BUKU DIPINJAM
    borrowedBooks.value = borrows
        .where((b) => b.status == Status.onBorrow)
        .length;

    /// JUMLAH REQUEST PINJAM
    borrowRequests.value = borrows
        .where((b) => b.status == Status.pending)
        .length;

    /// BUKU TERSEDIA
    availableBooks.value = totalBooks.value - borrowedBooks.value;

    stats.value = [
      {'title': 'All Book', 'value': totalBooks, 'color': AppColor.Primary500},
      {
        'title': 'Available Book',
        'value': availableBooks,
        'color': AppColor.Success500,
      },
      {
        'title': 'Borrowed Book',
        'value': borrowedBooks,
        'color': AppColor.Warning500,
      },
      {
        'title': 'Borrow Request',
        'value': borrowRequests,
        'color': AppColor.Danger500,
      },
    ];
  }
}
