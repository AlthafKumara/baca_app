import 'dart:io';

import 'package:baca_app/app/core/utils/image_picker.dart';
import 'package:baca_app/app/core/widget/bottom_sheet.dart';
import 'package:baca_app/app/core/widget/snackbar.dart';
import 'package:baca_app/app/data/services/auth_services.dart';
import 'package:baca_app/app/data/services/profile_services.dart';
import 'package:baca_app/app/modules/auth/utils/existing_email.dart';
import 'package:baca_app/app/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AuthController extends GetxController {
  final registerkey = GlobalKey<FormState>();
  final loginkey = GlobalKey<FormState>();
  final completeprofilekey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmpasswordController = TextEditingController();
  final nameController = TextEditingController();

  final AuthServices authServices = AuthServices();
  final ProfileServices profileServices = ProfileServices();
  final ExistingEmail availableEmail = ExistingEmail();

  var gender = RxnString();
  Rx<File?> selectedImage = Rx<File?>(null);
  var isObsecureText = true.obs;
  var isLoading = false.obs;

  Future<void> pickImage() async {
    final file = await ImagePickerUtil.pickImageFromGalerry();

    if (file != null) {
      selectedImage.value = file;
    }
  }

  void handleObsecure() {
    isObsecureText.value = !isObsecureText.value;
  }

  void handleRegister() async {
    emailController.text.trim();
    passwordController.text.trim();
    confirmpasswordController.text.trim();

    final available = await availableEmail.checkExistingEmail(
      emailController.text,
    );

    if (!registerkey.currentState!.validate()) {
      return;
    }

    if (!available) {
      CustomSnackbar.failedSnackbar("Email already exist");
      return;
    }

    try {
      isLoading.value = true;
      authServices.register(emailController.text, passwordController.text);
      Get.offNamed(Routes.COMPLETE_PROFILE);
    } catch (e) {
      CustomSnackbar.failedSnackbar(e.toString());
    } finally {
      isLoading.value = false;
    }
  }

  void handleCompleteProfile() async {
    if (!completeprofilekey.currentState!.validate()) {
      return;
    }

    try {
      isLoading.value = true;

      final user = await authServices.supabase.auth.currentUser;
      if (user == null) throw "User Not Found";

      await profileServices.createProfile(
        userId: user.id,
        email: user.email!,
        fullName: nameController.text,
        gender: gender.value!,
        photoFile: selectedImage.value,
      );
      CustomBottomSheet.singleBottomSheet(
        image: "assets/auth/response/register_succes.png",
        title: "Your account successfully created",
        message:
            "Your account has successfully created. You can go to login page first to login into your account!",
        buttonText: "Yay! Continue",
        onPressed: () {
          Get.offAllNamed(Routes.HOME);
        },
      );
    } catch (e) {
      CustomSnackbar.failedSnackbar(e.toString());
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> handleLogin() async {
    if (!loginkey.currentState!.validate()) {
      return;
    }

    try {
      isLoading.value = true;

      await authServices.login(emailController.text, passwordController.text);

      final user = authServices.supabase.auth.currentUser;
      if (user == null) throw "User not found after login";

      CustomSnackbar.succesSnackbar("Login success");

      final profile = await profileServices.loadProfile(user.id);

      if (profile == null) {
        Get.offAllNamed(Routes.COMPLETE_PROFILE);
      }

      final role = profile?['role'];

      if (role == 'admin') {
        Get.offAllNamed(Routes.ADMIN_HOME);
      } else {
        Get.offAllNamed(Routes.HOME);
      }
    } catch (e) {
      CustomSnackbar.failedSnackbar(e.toString());
    } finally {
      isLoading.value = false;
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
