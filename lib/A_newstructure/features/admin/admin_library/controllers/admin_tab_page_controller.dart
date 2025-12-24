import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AdminTabPageController extends GetxController
    with GetSingleTickerProviderStateMixin {
  late TabController tabController;

  var currentindex = 0.obs;

  @override
  void onInit() {
    tabController = TabController(length: 2, vsync: this);

    tabController.addListener(() {
      currentindex.value = tabController.index;
    });
    super.onInit();
  }

  @override
  void onClose() {
    tabController.dispose();
    super.onClose();
  }
}
