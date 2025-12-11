import 'package:baca_app/app/core/widget/snackbar.dart';
import 'package:baca_app/app/data/model/borrow_model.dart';
import 'package:baca_app/app/data/services/borrow_services.dart';
import 'package:baca_app/app/routes/app_pages.dart';
import 'package:get/get.dart';

class HandleBorrowController extends GetxController with StateMixin<Borrow> {
  final borrowServices = BorrowServices();

  void handleBorrow({required String userId, required int bookId}) async {
    change(null, status: RxStatus.loading());

    try {
      await borrowServices.createBorrow(userId: userId, bookId: bookId);
      change(null, status: RxStatus.success());

      CustomSnackbar.succesSnackbar("Book successfully borrowed");
      Get.offAllNamed(Routes.LIBRARY);
    } catch (e) {
      change(null, status: RxStatus.error(e.toString()));
    }
  }
}
