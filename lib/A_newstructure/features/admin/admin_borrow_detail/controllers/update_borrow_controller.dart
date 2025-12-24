import 'package:baca_app/A_newstructure/configs/routes/route.dart';
import 'package:baca_app/A_newstructure/features/admin/admin_borrow_detail/repositories/update_borrow_repository.dart';
import 'package:baca_app/A_newstructure/shared/widgets/snackbar.dart';
import 'package:get/get.dart';

class UpdateBorrowController extends GetxController with StateMixin<void> {
  final borrowRepo = UpdateBorrowRepository();
  void handleRejected(int borrowId) async {
    try {
      change(null, status: RxStatus.loading());
      await borrowRepo.updateBorrowStatus(
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
      await borrowRepo.updateBorrowStatus(
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
      await borrowRepo.updateBorrowStatus(
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
