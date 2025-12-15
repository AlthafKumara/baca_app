import 'package:baca_app/app/modules/user/search/controllers/search_get_book_controller.dart';
import 'package:get/get.dart';

import '../controllers/search_page_controller.dart';

class SearchBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SearchPageController>(() => SearchPageController());
    Get.lazyPut<SearchGetBookController>(() => SearchGetBookController());
  }
}
