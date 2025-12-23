import 'package:baca_app/A_newstructure/configs/routes/route.dart';
import 'package:baca_app/A_newstructure/features/user/user_book_detail/repositories/create_borrow_repository.dart';
import 'package:baca_app/A_newstructure/shared/widgets/snackbar.dart';
import 'package:get/get.dart';

class HandleBorrowController extends GetxController {
  final borrowRepo = CreateBorrowRepository();

  void handleBorrow({required String userId, required int bookId}) async {
    try {
      await borrowRepo.createBorrow(userId: userId, bookId: bookId);

      CustomSnackbar.succesSnackbar("Book successfully borrowed");
      Get.offAllNamed(Routes.USER_LIBRARY);
    } catch (e) {
      CustomSnackbar.failedSnackbar(e.toString());
    }
  }
}
