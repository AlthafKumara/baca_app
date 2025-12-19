import 'package:baca_app/A_laststructure/app/data/model/book_category.dart';
import 'package:baca_app/A_laststructure/app/data/model/book_model.dart';
import 'package:baca_app/A_laststructure/app/data/services/book_category_services.dart';
import 'package:get/get.dart';

class BookCatagoryController extends GetxController {
  BookCategoryServices services = BookCategoryServices();

  var categories = <BookCategory>[].obs;
  Rxn<BookCategory> category = Rxn<BookCategory>();

  var selectedCategoryId = Rx<int?>(null);

  var isLoading = false.obs;
  var selectedIndex = 0.obs;

  void getBookCategory() async {
    isLoading.value = true;
    try {
      final result = await services.getCategoryBook();
      categories.assignAll(result);
    } catch (e) {
      print(e);
    } finally {
      isLoading.value = false;
    }
  }

  void getBookCategoryById(int id) async {
    isLoading.value = true;
    try {
      final result = await services.getCategoryBookById(id);
      category.value = result;
    } catch (e) {
      print(e);
    } finally {
      isLoading.value = false;
    }
  }

  void onpress(int index) {
    selectedIndex.value = index;
    selectedCategoryId.value = categories[index].id;
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
