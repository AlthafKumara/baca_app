import 'package:baca_app/A_newstructure/features/user/user_search/controllers/user_search_book_controller.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class UserSearchPageController extends GetxController {
  final searchcontroller = TextEditingController();
  final bookC = Get.find<UserSearchBookController>();

  void searchChanged() {
    bookC.filterBooks(searchcontroller.text.trim());
  }

  @override
  void onInit() {
    super.onInit();
    searchcontroller.addListener(searchChanged);
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
