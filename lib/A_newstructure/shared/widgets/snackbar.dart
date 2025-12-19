import 'package:baca_app/A_newstructure/shared/styles/app_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class CustomSnackbar {
  CustomSnackbar._();

  static void succesSnackbar(String message) {
    Get.snackbar(
      animationDuration: Duration(milliseconds: 300),
      duration: Duration(seconds: 2),
      snackPosition: SnackPosition.TOP,
      borderRadius: 10.r,
      snackStyle: SnackStyle.FLOATING,
      "Success",
      message,
      backgroundColor: AppColor.Success600,
      colorText: AppColor.Neutral100,
    );
  }

  static void failedSnackbar(String message) {
    Get.snackbar(
      animationDuration: Duration(milliseconds: 300),
      duration: Duration(seconds: 2),
      snackPosition: SnackPosition.TOP,
      borderRadius: 10.r,
      snackStyle: SnackStyle.FLOATING,
      "Failed",
      message,
      backgroundColor: AppColor.Danger600,
      colorText: AppColor.Neutral100,
    );
  }
}
