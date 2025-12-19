import 'package:baca_app/A_laststructure/app/core/color/app_color.dart';
import 'package:baca_app/A_laststructure/app/core/widget/button_medium.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class CustomDialog {
  CustomDialog._();

  static void warningDialog({
    String? message,
    String? title,
    void Function()? onConfirm,
    void Function()? onCancel,
  }) {
    Get.defaultDialog(
      title: title!,
      middleText: message!,
      backgroundColor: AppColor.Danger500,
      radius: 10.r,

      confirm: CustomButtonMedium.primaryMedium(
        color: AppColor.Danger600,
        text: "Confirm",
        isLoading: false,
        onPressed: onConfirm,
      ),
      cancel: CustomButtonMedium.primaryMedium(
        color: AppColor.Neutral100,
        text: "Cancel",
        isLoading: false,
        onPressed: onCancel,
      ),
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
