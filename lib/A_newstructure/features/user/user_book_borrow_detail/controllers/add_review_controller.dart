import 'package:baca_app/A_newstructure/configs/routes/route.dart';
import 'package:baca_app/A_newstructure/features/user/user_book_borrow_detail/controllers/user_book_borrow_detail_controller.dart';
import 'package:baca_app/A_newstructure/features/user/user_book_borrow_detail/repositories/add_review_repository.dart';
import 'package:baca_app/A_newstructure/features/user/user_book_borrow_detail/repositories/update_borrow_review_repository.dart';
import 'package:baca_app/A_newstructure/shared/widgets/snackbar.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class AddReviewController extends GetxController {
  // ================ IMPORT REPO ================
  final reviewRepo = AddReviewRepository();
  final borrowRepo = UpdateBorrowReviewRepository();
  final profile = Get.find<UserBookBorrowDetailController>();

  // =============== VARIABLE ================
  var rating = 5.obs;

  final messageReviewController = TextEditingController();

  // =============== FUNCTION ================
  void setRating(int value) {
    rating.value = value;
  }

  void handleReview(int bookId, int borrowId) async {
    try {
      await reviewRepo.createReview(
        userId: profile.profile.value!.id,
        bookId: bookId,
        text: messageReviewController.text,
        rating: rating.value,
      );
      await borrowRepo.updateBorrowReview(borrowId: borrowId);

      CustomSnackbar.succesSnackbar("Review successfully added");
      toLibrary();
    } catch (e) {
      CustomSnackbar.failedSnackbar(e.toString());
    }
  }

  // =============== Navigation ================
  void toLibrary() => Get.offAllNamed(Routes.USER_LIBRARY);
}
