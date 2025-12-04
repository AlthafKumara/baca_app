import 'package:baca_app/app/data/model/book_category.dart';
import 'package:baca_app/app/data/model/book_model.dart';
import 'package:baca_app/app/data/services/book_category_services.dart';
import 'package:get/get.dart';

class BookCatagoryController extends GetxController {
  BookCategoryServices services = BookCategoryServices();

  var categories = <BookCategory>[].obs;

  var isLoading = false.obs;
  var selectedIndex = 0.obs;

  void getBookCategory() async {
    try {
      final result = await services.getCategoryBook();
      categories.assignAll(result);
    } catch (e) {
      print(e);
    } finally {
      isLoading.value = false;
    }
  }

  void onpress(int index) {
    selectedIndex.value = index;
  }

  @override
  void onInit() {
    super.onInit();
    getBookCategory();
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
