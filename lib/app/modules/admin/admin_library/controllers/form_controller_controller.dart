import 'dart:io';

import 'package:baca_app/app/core/utils/image_picker.dart';
import 'package:baca_app/app/core/widget/snackbar.dart';
import 'package:baca_app/app/data/services/book_services.dart';
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

  void handleSubmit(int categoryId) async {
    try {
      isLoading.value = true;
      if (selectedImage.value == null) {
        CustomSnackbar.failedSnackbar("Image cannot be empty");
      }
      if (!formKey.currentState!.validate()) {
        return;
      }

      await bookServices.createBook(
        title: titlecontroller.text,
        author: authorcontroller.text,
        photoFile: selectedImage.value,
        stock: stock.value,
        description: synopsiscontroller.text,
        categoryid: categoryId,
      );

      CustomSnackbar.succesSnackbar("Book successfully added");
    } catch (e) {
      CustomSnackbar.failedSnackbar(e.toString());

      print(e);
    } finally {
      isLoading.value = false;

      Get.offAllNamed(Routes.ADMIN_LIBRARY);
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
