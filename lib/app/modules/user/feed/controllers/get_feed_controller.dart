import 'package:baca_app/app/data/model/community_model.dart';
import 'package:baca_app/app/data/services/book_services.dart';
import 'package:baca_app/app/data/services/communnity_services.dart';
import 'package:baca_app/app/data/services/profile_services.dart';
import 'package:get/get.dart';

class GetFeedController extends GetxController
    with StateMixin<List<Community>> {
  final communityServices = CommunnityServices();
  final profileServices = ProfileServices();
  final bookServices = BookServices();

  var childFeed = <Community>[].obs;
  var parentFeed = <Community>[].obs;

  void getParrentFeed() async {
    try {
      final feed = await communityServices.getCommunity();

      if (feed.isEmpty) {
        change([], status: RxStatus.empty());
        return;
      }

      final parentFeed = feed.where((e) => e.parentId == null).toList();

      if (parentFeed.isEmpty) {
        change([], status: RxStatus.empty());
        return;
      }

      final userIds = parentFeed.map((e) => e.userId).toSet().toList();
      final List<int> bookIds = parentFeed
          .where((e) => e.bookId != null)
          .map((e) => e.bookId!)
          .toSet()
          .toList();

      if (bookIds.isNotEmpty) {
        final books = await bookServices.getBookById(bookIds);
        final bookMap = {for (var b in books) b.id: b};

        for (var item in parentFeed) {
          if (item.bookId != null && bookMap.containsKey(item.bookId)) {
            item.book = bookMap[item.bookId];
          }
        }
      }

      final profiles = await profileServices.getProfileById(userIds);
      final profileMap = {for (var p in profiles) p.id: p};

      for (var item in parentFeed) {
        final profile = profileMap[item.userId];

        if (profile == null) {
          throw Exception('Profile not found for userId ${item.userId}');
        }

        item.profile = profile;
      }

      final safeFeed = parentFeed.where((e) => e.profile != null).toList();

      change(safeFeed, status: RxStatus.success());
    } catch (e) {
      change(null, status: RxStatus.error(e.toString()));
    }
  }

  void getChildFeed() async {}

  @override
  void onInit() {
    super.onInit();
    getParrentFeed();
  }
}
