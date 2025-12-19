import 'package:get/get.dart';

class ChipController extends GetxController {
  var selectedIndex = 0.obs;

  void onpress(int index) {
    selectedIndex.value = index;
  }
}
