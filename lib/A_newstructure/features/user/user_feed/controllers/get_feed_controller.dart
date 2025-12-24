import 'package:baca_app/A_newstructure/features/user/user_feed/models/community_model.dart';
import 'package:baca_app/A_newstructure/features/user/user_feed/repositories/community_repository.dart';
import 'package:baca_app/A_newstructure/shared/repositories/get_book_by_id_repository.dart';
import 'package:baca_app/A_newstructure/shared/repositories/profile_repository.dart';
import 'package:get/get.dart';

class GetFeedController extends GetxController
    with StateMixin<List<CommunityModel>> {
  // ================== Import ==================
  final communityRepo = CommunityRepository();
  final profileRepo = ProfileRepository();
  final bookRepo = GetBookByIdRepository();

  // ================== Variable ==================

  var childFeed = <CommunityModel>[].obs;
  var parentFeed = <CommunityModel>[].obs;

  // ================== Function ==================

  void getFeed() async {
    try {
      final feed = await communityRepo.getCommunity();

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
        final books = await bookRepo.getBookById(bookIds);
        final bookMap = {for (var b in books) b.id: b};

        for (var item in feed) {
          if (item.bookId != null) {
            item.book = bookMap[item.bookId];
          }
        }
      }

      // ================== PROFILE ==================
      final userIds = feed.map((e) => e.userId).toSet().toList();
      final profiles = await profileRepo.getProfileById(userIds);
      final profileMap = {for (var p in profiles) p.id: p};

      for (var item in feed) {
        item.profile = profileMap[item.userId];
      }

      // ================== CHILD MAP ==================
      final Map<int, List<CommunityModel>> childMap = {};

      for (var child in childFeed) {
        final parentId = child.parentId;
        if (parentId == null) continue;

        childMap.putIfAbsent(parentId, () => []);
        childMap[parentId]!.add(child);
      }

      // ================== ASSIGN KE PARENT  ==================
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
