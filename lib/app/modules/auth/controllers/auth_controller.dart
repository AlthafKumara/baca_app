import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AuthController extends GetxController {
  final key = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  var email = "".obs;
  var password = "".obs;
  var isObsecureText = true.obs;

  void handleObsecure() {
    isObsecureText.value = !isObsecureText.value;
  }

  void handleLogin() {
    email.value = emailController.text.trim();
    password.value = passwordController.text.trim();

    if (key.currentState!.validate()) {
      return;
    }
  }

  

  @override
  void onInit() {
    super.onInit();
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
