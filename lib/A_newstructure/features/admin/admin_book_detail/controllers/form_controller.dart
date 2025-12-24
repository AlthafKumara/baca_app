import 'dart:io';

import 'package:baca_app/A_newstructure/configs/routes/route.dart';
import 'package:baca_app/A_newstructure/features/admin/admin_book_detail/repositories/add_update_book_repository.dart';
import 'package:baca_app/A_newstructure/shared/controllers/book_category_controller.dart';
import 'package:baca_app/A_newstructure/shared/models/book_model.dart';
import 'package:baca_app/A_newstructure/shared/widgets/snackbar.dart';
import 'package:baca_app/A_newstructure/utils/services/image_picker_services.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FormControllerController extends GetxController {
  final titlecontroller = TextEditingController();
  final synopsiscontroller = TextEditingController();
  final authorcontroller = TextEditingController();
  final stockcontroller = TextEditingController();
  final formKey = GlobalKey<FormState>();

  Rx<File?> selectedImage = Rx<File?>(null);
  final isLoading = false.obs;
  final stock = 0.obs;

  RxString oldImageUrl = ''.obs;

  RxBool isEdit = false.obs;

  final bookRepo = AddUpdateBookRepository();

  Future<void> pickCoverImage() async {
    final file = await ImagePickerServices.pickImageFromGalerry();

    if (file != null) {
      selectedImage.value = file;
    }

    if (file == null) {
      throw "Image cannot be empty";
    }
  }

  void handleSubmit(int categoryId, {BookModel? book}) async {
    try {
      isLoading.value = true;

      if (!formKey.currentState!.validate()) {
        CustomSnackbar.failedSnackbar("Please fill the form correctly");
        return;
      }

      if (isEdit.value == false && selectedImage.value == null) {
        CustomSnackbar.failedSnackbar("Image cannot be empty");
        return;
      }

      File? imageToUpload = selectedImage.value;

      if (isEdit.value == true && imageToUpload == null) {
        imageToUpload = null;
      }

      if (isEdit.value == true && book != null) {
        await bookRepo.updateBook(
          id: book.id,
          title: titlecontroller.text,
          author: authorcontroller.text,
          description: synopsiscontroller.text,
          stock: stock.value,
          categoryid: categoryId,
          photoFile: imageToUpload,
          oldImageUrl: oldImageUrl.value,
        );

        CustomSnackbar.succesSnackbar("Book successfully updated");
      } else if (book == null && isEdit.value == false) {
        await bookRepo.createBook(
          title: titlecontroller.text,
          author: authorcontroller.text,
          description: synopsiscontroller.text,
          stock: stock.value,
          categoryid: categoryId,
          photoFile: imageToUpload,
        );

        CustomSnackbar.succesSnackbar("Book successfully added");
      }

      Get.offAllNamed(Routes.ADMIN_LIBRARY);
    } catch (e) {
      CustomSnackbar.failedSnackbar(e.toString());
      print(e);
    } finally {
      isLoading.value = false;
    }
  }

  void increament() {
    stock.value++;
    stockcontroller.text = stock.value.toString();
  }

  void decreament() {
    if (stock.value > 0) {
      stock.value--;
      stockcontroller.text = stock.value.toString();
    }
  }

  void loadBook(BookModel? book) {
    if (book == null) {
      isEdit.value = false;
      titlecontroller.clear();
      synopsiscontroller.clear();
      authorcontroller.clear();
      stockcontroller.text = "0";
      selectedImage.value = null;
      oldImageUrl.value = "";
    } else {
      isEdit.value = true;

      titlecontroller.text = book.title;
      synopsiscontroller.text = book.description;
      authorcontroller.text = book.author;
      stockcontroller.text = book.stock.toString();

      oldImageUrl.value = book.coverUrl;

      selectedImage.value = null;
    }

    if (book != null) {
      Get.find<BookCatagoryController>().selectedCategoryId.value =
          book.category;
    }
  }

  @override
  void onInit() {
    super.onInit();

    stockcontroller.text = "0";

    stockcontroller.addListener(() {
      final value = int.tryParse(stockcontroller.text) ?? 0;
      stock.value = value;
    });
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
    titlecontroller.dispose();
    synopsiscontroller.dispose();
    authorcontroller.dispose();
    stockcontroller.dispose();
  }
}
