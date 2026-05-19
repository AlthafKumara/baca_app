import 'dart:developer';

import 'package:baca_app/A_newstructure/configs/routes/route.dart';
import 'package:baca_app/A_newstructure/features/auth/login/repositories/login_repository.dart';
import 'package:baca_app/A_newstructure/shared/repositories/fcm_token_repository.dart';
import 'package:baca_app/A_newstructure/shared/repositories/profile_repository.dart';
import 'package:baca_app/A_newstructure/shared/widgets/snackbar.dart';
import 'package:baca_app/A_newstructure/utils/enums/profiles_enum.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {
  // ------------------------------REPO-----------------------------------
  final loginRepository = LoginRepository();
  final profileRepository = ProfileRepository();
  final fcmTokenRepository = FCMTokenRepository();

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

  Future<void> handleLogin() async {
    if (!loginkey.currentState!.validate()) {
      return;
    }

    try {
      isLoading.value = true;

      await loginRepository.login(
        emailController.text,
        passwordController.text,
      );

      final user = loginRepository.supabase.auth.currentUser;
      if (user == null) throw "User not found after login";


      final profile = await profileRepository.loadProfile();
      await fcmTokenRepository.saveToken(user.id);
      

      CustomSnackbar.succesSnackbar("Login success");
      if (profile == null) {
        Get.offAllNamed(Routes.COMPLETE_PROFILE);
      }

      final role = profile?['role'];

      if (role == Role.admin.name) {
        toHomeAdmin();
      } else {
        toHomeUser();
      }
    } catch (e) {
      log(e.toString());
      CustomSnackbar.failedSnackbar(e.toString());
    } finally {
      isLoading.value = false;
    }
  }

  // ------------------------------NAVIGATOR-----------------------------------

  void toRegister() {
    Get.offAllNamed(Routes.REGISTER);
  }

  void toHomeAdmin() {
    Get.offAllNamed(Routes.ADMIN_HOME);
  }

  void toHomeUser() {
    Get.offAllNamed(Routes.USER_HOME);
  }
}
