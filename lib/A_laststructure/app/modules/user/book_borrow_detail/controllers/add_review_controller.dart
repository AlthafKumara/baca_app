import 'package:baca_app/A_laststructure/app/core/widget/snackbar.dart';
import 'package:baca_app/A_laststructure/app/data/services/borrow_services.dart';
import 'package:baca_app/A_laststructure/app/data/services/review_services.dart';
import 'package:baca_app/A_laststructure/app/modules/user/book_borrow_detail/controllers/book_borrow_detail_controller.dart';
import 'package:baca_app/A_laststructure/app/modules/user/profile/controllers/profile_controller.dart';
import 'package:baca_app/A_laststructure/app/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddReviewController extends GetxController {
  final reviewService = ReviewServices();
  final borrowService = BorrowServices();
  final profile = Get.find<BookBorrowDetailController>();

  var rating = 5.obs;

  final messageReviewController = TextEditingController();
  void setRating(int value) {
    rating.value = value;
  }

  void handleReview(int bookId, int borrowId) async {
    try {
      await reviewService.createReview(
        userId: profile.profile.value!.id,
        bookId: bookId,
        text: messageReviewController.text,
        rating: rating.value,
      );
      await borrowService.updateBorrowReview(borrowId: borrowId);

      CustomSnackbar.succesSnackbar("Review successfully added");
      Get.offAllNamed(Routes.LIBRARY);
    } catch (e) {
      CustomSnackbar.failedSnackbar(e.toString());
    }
  }
}
