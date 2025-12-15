import 'package:baca_app/app/modules/user/search/controllers/search_get_book_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SearchPageController extends GetxController {
  final searchcontroller = TextEditingController();
  final bookC = Get.find<SearchGetBookController>();

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
