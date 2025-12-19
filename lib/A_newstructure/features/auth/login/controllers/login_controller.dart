import 'package:baca_app/A_newstructure/configs/routes/route.dart';
import 'package:baca_app/A_newstructure/shared/widgets/snackbar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {
  // ------------------------------VARIABLES-----------------------------------
  final loginkey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  var isObsecureText = true.obs;
  var isLoading = false.obs;

  // --------------------------------FUNCTIONS---------------------------------

  void handleObsecure() {
    isObsecureText.value = !isObsecureText.value;
  }

  // ------------------------------NAVIGATOR-----------------------------------

  void toRegister() {
    Get.offNamed(Routes.REGISTER);
  }

  void toHome() {}
}
