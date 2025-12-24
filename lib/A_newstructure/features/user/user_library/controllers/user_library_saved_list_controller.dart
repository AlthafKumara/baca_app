import 'package:baca_app/A_newstructure/configs/routes/route.dart';
import 'package:baca_app/A_newstructure/features/user/user_library/controllers/user_library_controller.dart';
import 'package:baca_app/A_newstructure/features/user/user_library/repositories/add_delete_saved_list_repository.dart';
import 'package:baca_app/A_newstructure/shared/models/saved_list_model.dart';
import 'package:baca_app/A_newstructure/shared/repositories/get_book_by_id_repository.dart';
import 'package:baca_app/A_newstructure/shared/repositories/get_saved_list.dart';
import 'package:baca_app/A_newstructure/shared/widgets/snackbar.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class UserLibrarySavedListController extends GetxController
    with StateMixin<List<SavedListModel>> {
  final addDeleteSavedListRepo = AddDeleteSavedListRepository();
  final getSavedListRepo = GetSavedListRepository();
  final getbookIdRepo = GetBookByIdRepository();
  final libraryC = Get.find<UserLibraryController>();

  final listnameC = TextEditingController();
  final savelistkey = GlobalKey<FormState>();

  final selectedItemId = Rx<int?>(null);

  void handlecreateSavedList() async {
    if (!savelistkey.currentState!.validate()) {
      return;
    }
    try {
      change(null, status: RxStatus.loading());
      await addDeleteSavedListRepo.createSavedList(
        userId: libraryC.profile.value!.id,
        listname: listnameC.text,
      );
      listnameC.clear();
      getSavedList(libraryC.profile.value!.id);
      CustomSnackbar.succesSnackbar("Saved list successfully created");
      Get.offAllNamed(Routes.USER_LIBRARY);
    } catch (e) {
      change(null, status: RxStatus.error(e.toString()));
      CustomSnackbar.failedSnackbar(e.toString());
    }
  }

  void getSavedList(String userId) async {
    try {
      change(null, status: RxStatus.loading());
      final listbook = await getSavedListRepo.getSavedList(userId);

      if (listbook.isEmpty) {
        change([], status: RxStatus.empty());
      } else {
        for (var list in listbook) {
          if (list.bookId != null) {
            list.books = (await getbookIdRepo.getBookById([
              list.bookId!,
            ])).first;
          }
        }

        change(listbook, status: RxStatus.success());
      }
    } catch (e) {
      change(null, status: RxStatus.error(e.toString()));
    }
  }

  void handleDeleteSavedList({required int listId}) async {
    try {
      await addDeleteSavedListRepo.deleteBookList(listId: listId);
      getSavedList(libraryC.profile.value!.id);

      CustomSnackbar.succesSnackbar("Saved list successfully deleted");
      selectedItemId.value = null;
    } catch (e) {
      CustomSnackbar.failedSnackbar(e.toString());
    }
  }

  @override
  void onInit() {
    super.onInit();

    ever(libraryC.profile, (profile) {
      if (profile != null) {
        getSavedList(profile.id);
      }
    });
  }
}
