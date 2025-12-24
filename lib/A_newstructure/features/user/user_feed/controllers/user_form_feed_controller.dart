import 'package:baca_app/A_newstructure/configs/routes/route.dart';
import 'package:baca_app/A_newstructure/features/user/user_feed/controllers/get_book_feed_controller.dart';
import 'package:baca_app/A_newstructure/features/user/user_feed/controllers/user_feed_controller.dart';
import 'package:baca_app/A_newstructure/features/user/user_feed/repositories/community_repository.dart';
import 'package:baca_app/A_newstructure/shared/widgets/snackbar.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class UserFormFeedController extends GetxController {
  //  ================= Importing =================
  final communityRepo = CommunityRepository();
  final bookC = Get.find<GetBookFeedController>();
  final profileC = Get.find<UserFeedController>();

  //  ================= Variable =================
  final messageText = "".obs;
  final messageController = TextEditingController();
  int? get selectedBookId => bookC.selectedBookId.value;

  //  ================= Function =================

  void handleSubmitFeed() async {
    try {
      await communityRepo.createMessage(
        userId: profileC.profile.value!.id,
        bookId: selectedBookId,
        messageText: messageText.value,
      );

      messageController.clear();
      messageText.value = "";

      CustomSnackbar.succesSnackbar("Feed successfully created");
      toFeed();
    } catch (e) {
      CustomSnackbar.failedSnackbar(e.toString());
    }
  }

  void handleReplyFeed({required int communityId}) async {
    try {
      await communityRepo.replyMessage(
        messageText: messageText.value,
        userId: profileC.profile.value!.id,
        parentId: communityId,
        bookId: selectedBookId,
      );

      messageController.clear();
      messageText.value = "";

      CustomSnackbar.succesSnackbar("Succesfully replyed");
      toFeed();
    } catch (e) {
      CustomSnackbar.failedSnackbar(e.toString());
    }
  }

  @override
  void onInit() {
    super.onInit();
    messageController.addListener(
      () => messageText.value = messageController.text,
    );
  }

  //  ================= Navigation =================

  void toFeed() => Get.offAllNamed(Routes.USER_FEED);
}
