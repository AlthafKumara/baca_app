import 'package:baca_app/A_laststructure/app/core/widget/snackbar.dart';
import 'package:baca_app/A_laststructure/app/data/services/borrow_services.dart';
import 'package:baca_app/A_laststructure/app/routes/app_pages.dart';
import 'package:get/get.dart';

class UpdateBorrowController extends GetxController with StateMixin<void> {
  final borrowServices = BorrowServices();
  void handleRejected(int borrowId) async {
    try {
      change(null, status: RxStatus.loading());
      await borrowServices.updateBorrowStatus(
        borrowId: borrowId,
        status: "Rejected",
        returnDate: DateTime.now(),
        borrowDate: DateTime.now(),
      );
      change(null, status: RxStatus.success());
      CustomSnackbar.succesSnackbar("Book request successfully rejected");
      Get.offAllNamed(Routes.ADMIN_LIBRARY);
    } catch (e) {
      CustomSnackbar.failedSnackbar(e.toString());
      change(null, status: RxStatus.error(e.toString()));
    }
  }

  void handleApproved(int borrowId) async {
    try {
      change(null, status: RxStatus.loading());
      await borrowServices.updateBorrowStatus(
        borrowId: borrowId,
        status: "On Borrow",
        borrowDate: DateTime.now(),
      );
      change(null, status: RxStatus.success());
      CustomSnackbar.succesSnackbar("Book request successfully approved");
      Get.offAllNamed(Routes.ADMIN_LIBRARY);
    } catch (e) {
      CustomSnackbar.failedSnackbar(e.toString());
      print(e);
      change(null, status: RxStatus.error(e.toString()));
    }
  }

  void handleReturned(int borrowId) async {
    try {
      change(null, status: RxStatus.loading());
      await borrowServices.updateBorrowStatus(
        borrowId: borrowId,
        status: "Returned",
        returnDate: DateTime.now(),
      );
      change(null, status: RxStatus.success());
      CustomSnackbar.succesSnackbar("Book borrowed successfully returned");
      Get.offAllNamed(Routes.ADMIN_LIBRARY);
    } catch (e) {
      CustomSnackbar.failedSnackbar(e.toString());
      change(null, status: RxStatus.error(e.toString()));
    }
  }
}
