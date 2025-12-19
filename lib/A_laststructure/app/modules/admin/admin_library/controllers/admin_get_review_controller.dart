import 'package:baca_app/A_laststructure/app/data/model/book_review.dart';
import 'package:baca_app/A_laststructure/app/data/services/profile_services.dart';
import 'package:baca_app/A_laststructure/app/data/services/review_services.dart';
import 'package:get/get.dart';

class AdminGetReviewcontroller extends GetxController
    with StateMixin<List<BookReview>> {
  final reviewServices = ReviewServices();
  final profileServices = ProfileServices();

  var listreview = <BookReview>[].obs;

  void fetchReviewbyBookId(int bookId) async {
    change(null, status: RxStatus.loading());
    try {
      final review = await reviewServices.getReview(bookId);

      if (review.isEmpty) {
        change([], status: RxStatus.empty());
      }

      final userIds = review.map((e) => e.userId).toList();
      final profiles = await profileServices.getProfileById(userIds);
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
}
