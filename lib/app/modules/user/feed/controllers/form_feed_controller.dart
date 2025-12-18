import 'package:baca_app/app/core/widget/snackbar.dart';
import 'package:baca_app/app/data/services/communnity_services.dart';
import 'package:baca_app/app/modules/user/feed/controllers/feed_controller.dart';
import 'package:baca_app/app/modules/user/feed/controllers/get_book_feed_controller.dart';
import 'package:baca_app/app/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FormFeedController extends GetxController {
  final communityServices = CommunnityServices();
  final bookC = Get.find<GetBookFeedController>();
  final profileC = Get.find<FeedController>();

  final messageText = "".obs;
  final messageController = TextEditingController();

  int? get selectedBookId => bookC.selectedBookId.value;

  void handleSubmitFeed() async {
    try {
      await communityServices.createMessage(
        userId: profileC.profile.value!.id,
        bookId: selectedBookId,
        messageText: messageText.value,
      );

      messageController.clear();
      messageText.value = "";

      CustomSnackbar.succesSnackbar("Feed successfully created");
      Get.offAllNamed(Routes.FEED);
    } catch (e) {
      CustomSnackbar.failedSnackbar(e.toString());
    }
  }

  void handleReplyFeed({required int communityId}) async {
    try {
      await communityServices.replyMessage(
        messageText: messageText.value,
        userId: profileC.profile.value!.id,
        parentId: communityId,
        bookId: selectedBookId,
      );

      messageController.clear();
      messageText.value = "";

      CustomSnackbar.succesSnackbar("Succesfully replyed");
      Get.offAllNamed(Routes.FEED);
    } catch (e) {
      CustomSnackbar.failedSnackbar(e.toString());
    }
  }

  @override
  void onInit() {
    super.onInit();
    messageController.addListener(() {
      messageText.value = messageController.text;
    });
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }
}
