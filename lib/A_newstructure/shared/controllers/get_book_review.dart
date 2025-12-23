import 'package:baca_app/A_newstructure/shared/repositories/get_book_review_repository.dart';
import 'package:baca_app/A_newstructure/shared/models/book_review_model.dart';
import 'package:baca_app/A_newstructure/shared/repositories/profile_repository.dart';
import 'package:get/get.dart';

class GetBookReview extends GetxController with StateMixin<List<BookReview>> {
  // =============== Import =============== //
  final getBookReviewRepository = GetBookReviewRepository();
  final profileRepository = ProfileRepository();
  // =============== Variable =============== //

  var listreview = <BookReview>[].obs;
  // =============== Function =============== //

  void fetchReviewbyBookId(int bookId) async {
    change(null, status: RxStatus.loading());
    try {
      final review = await getBookReviewRepository.getReview(bookId);

      if (review.isEmpty) {
        change([], status: RxStatus.empty());
      }

      final userIds = review.map((e) => e.userId).toList();
      final profiles = await profileRepository.getProfileById(userIds);
      final profileMap = {for (var p in profiles) p.id: p};
      for (var profile in review) {
        if (profileMap.containsKey(profile.userId)) {
          profile.profile = profileMap[profile.userId];
        }
      }

      change(review, status: RxStatus.success());
      listreview.value = review;
    } catch (e) {
      change(null, status: RxStatus.error(e.toString()));
    }
  }

  @override
  void onInit() {
    super.onInit();
  }
}
