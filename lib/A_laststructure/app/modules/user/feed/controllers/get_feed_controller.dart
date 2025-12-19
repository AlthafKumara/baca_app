import 'package:baca_app/A_laststructure/app/data/model/community_model.dart';
import 'package:baca_app/A_laststructure/app/data/services/book_services.dart';
import 'package:baca_app/A_laststructure/app/data/services/communnity_services.dart';
import 'package:baca_app/A_laststructure/app/data/services/profile_services.dart';
import 'package:get/get.dart';

class GetFeedController extends GetxController
    with StateMixin<List<Community>> {
  final communityServices = CommunnityServices();
  final profileServices = ProfileServices();
  final bookServices = BookServices();

  var childFeed = <Community>[].obs;
  var parentFeed = <Community>[].obs;

  void getFeed() async {
    try {
      final feed = await communityServices.getCommunity();

      if (feed.isEmpty) {
        change([], status: RxStatus.empty());
        return;
      }

      final parentFeed = feed.where((e) => e.parentId == null).toList();
      final childFeed = feed.where((e) => e.parentId != null).toList();

      // ================== BOOK ==================
      // ================== BOOK ==================
      final bookIds = feed
          .where((e) => e.bookId != null)
          .map((e) => e.bookId!)
          .toSet()
          .toList();

      if (bookIds.isNotEmpty) {
        final books = await bookServices.getBookById(bookIds);
        final bookMap = {for (var b in books) b.id: b};

        for (var item in feed) {
          if (item.bookId != null) {
            item.book = bookMap[item.bookId];
          }
        }
      }

      // ================== PROFILE ==================
      final userIds = feed.map((e) => e.userId).toSet().toList();
      final profiles = await profileServices.getProfileById(userIds);
      final profileMap = {for (var p in profiles) p.id: p};

      for (var item in feed) {
        item.profile = profileMap[item.userId];
      }

      // ================== CHILD MAP ==================
      final Map<int, List<Community>> childMap = {};

      for (var child in childFeed) {
        final parentId = child.parentId;
        if (parentId == null) continue;

        childMap.putIfAbsent(parentId, () => []);
        childMap[parentId]!.add(child);
      }

      // ================== ASSIGN KE PARENT 🔥 ==================
      for (var parent in parentFeed) {
        parent.replies = childMap[parent.id] ?? [];
      }

      change(parentFeed, status: RxStatus.success());
    } catch (e) {
      change(null, status: RxStatus.error(e.toString()));
    }
  }

  @override
  void onInit() {
    super.onInit();
    getFeed();
  }
}
