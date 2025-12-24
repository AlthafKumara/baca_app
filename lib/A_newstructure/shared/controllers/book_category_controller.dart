import 'package:baca_app/A_newstructure/shared/models/book_category_model.dart';
import 'package:baca_app/A_newstructure/shared/repositories/get_book_category_repository.dart';
import 'package:get/get.dart';

class BookCatagoryController extends GetxController {
  final categoryRepo = GetBookCategoryRepository();

  var categories = <BookCategoryModel>[].obs;
  Rxn<BookCategoryModel> category = Rxn<BookCategoryModel>();

  var selectedCategoryId = Rx<int?>(null);

  var selectedIndex = 0.obs;

  void getBookCategory() async {
    try {
      final result = await categoryRepo.getCategoryBook();
      categories.assignAll(result);
    } catch (e) {
      print(e);
    }
  }

  void getBookCategoryById(int id) async {
    try {
      final result = await categoryRepo.getCategoryBookById(id);
      category.value = result;
    } catch (e) {
      print(e);
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
