import 'package:baca_app/A_laststructure/app/core/widget/snackbar.dart';
import 'package:baca_app/A_laststructure/app/data/model/book_model.dart';
import 'package:baca_app/A_laststructure/app/data/model/saved_list_model.dart';
import 'package:baca_app/A_laststructure/app/data/services/book_services.dart';
import 'package:baca_app/A_laststructure/app/data/services/saved_list_services.dart';
import 'package:baca_app/A_laststructure/app/modules/user/library/controllers/library_controller.dart';
import 'package:baca_app/A_laststructure/app/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SavedListController extends GetxController
    with StateMixin<List<SavedListModel>> {
  final savedlistservices = SavedListServices();
  final bookServices = BookServices();
  final libraryC = Get.find<LibraryController>();

  final listnameC = TextEditingController();
  final savelistkey = GlobalKey<FormState>();

  final selectedItemId = Rx<int?>(null);

  void handlecreateSavedList() async {
    if (!savelistkey.currentState!.validate()) {
      return;
    }
    try {
      change(null, status: RxStatus.loading());
      await savedlistservices.createSavedList(
        userId: libraryC.profile.value!.id,
        listname: listnameC.text,
      );
      listnameC.clear();
      getSavedList(libraryC.profile.value!.id);
      CustomSnackbar.succesSnackbar("Saved list successfully created");
      Get.offAllNamed(Routes.LIBRARY);
    } catch (e) {
      change(null, status: RxStatus.error(e.toString()));
      CustomSnackbar.failedSnackbar(e.toString());
    }
  }

  void getSavedList(String userId) async {
    try {
      change(null, status: RxStatus.loading());
      final listbook = await savedlistservices.getSavedList(userId);

      if (listbook.isEmpty) {
        change([], status: RxStatus.empty());
      } else {
        for (var list in listbook) {
          if (list.bookId != null) {
            list.books = (await bookServices.getBookById([list.bookId!])).first;
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
      await savedlistservices.deleteBookList(listId: listId);
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
