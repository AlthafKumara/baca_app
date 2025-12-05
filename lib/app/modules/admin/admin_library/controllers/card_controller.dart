import 'package:get/get.dart';

class CardController extends GetxController {
  var selectedMode = false.obs;
  var onSelected = false.obs;
  var selectedList = <int, bool>{}.obs;

  void toggleSelect(int bookId) {
    if (selectedList[bookId] == true) {
      selectedList.remove(bookId);
    } else {
      selectedList[bookId] = true;
    }
  }

  bool isCardSelected(int bookId) {
    return selectedList[bookId] ?? false;
  }

  List<int> getSelectedIds() {
    return selectedList.entries
        .where((e) => e.value)
        .map((e) => e.key)
        .toList();
  }

  @override
  void onInit() {
    super.onInit();
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
