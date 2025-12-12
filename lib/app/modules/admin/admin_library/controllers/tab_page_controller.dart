import 'package:get/get.dart';
import 'package:flutter/material.dart';

class TabPageController extends GetxController
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
