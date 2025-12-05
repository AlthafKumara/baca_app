import 'dart:io';

import 'package:baca_app/app/core/utils/image_picker.dart';
import 'package:baca_app/app/core/widget/snackbar.dart';
import 'package:baca_app/app/data/model/book_model.dart';
import 'package:baca_app/app/data/services/book_services.dart';
import 'package:baca_app/app/modules/admin/admin_library/controllers/book_catagory_controller.dart';
import 'package:baca_app/app/routes/app_pages.dart';
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

  BookServices bookServices = BookServices();

  Future<void> pickCoverImage() async {
    final file = await ImagePickerUtil.pickImageFromGalerry();

    if (file != null) {
      selectedImage.value = file;
    }

    if (file == null) {
      throw "Image cannot be empty";
    }
  }

  void handleSubmit(int categoryId, {Book? book}) async {
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
        await bookServices.updateBook(
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
        await bookServices.createBook(
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

  void loadBook(Book? book) {
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
