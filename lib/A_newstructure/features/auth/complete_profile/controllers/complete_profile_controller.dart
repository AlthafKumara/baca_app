import 'dart:io';

import 'package:baca_app/A_newstructure/shared/repositories/fcm_token_repository.dart';
import 'package:baca_app/A_newstructure/utils/services/image_picker_services.dart';
import 'package:baca_app/A_newstructure/configs/routes/route.dart';
import 'package:baca_app/A_newstructure/constants/assets_constant.dart';
import 'package:baca_app/A_newstructure/features/auth/complete_profile/repositories/complete_profile_repository.dart';
import 'package:baca_app/A_newstructure/shared/widgets/bottom_sheet.dart';
import 'package:baca_app/A_newstructure/shared/widgets/snackbar.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class CompleteProfileController extends GetxController {
  // ============ Import =============== //
  final completeProfileRepository = CompleteProfileRepository();
  final imagePickerServices = ImagePickerServices();
  final fcmTokenRepository = FCMTokenRepository();

  // ============= Variables =============== //
  final nameController = TextEditingController();

  final completeprofilekey = GlobalKey<FormState>();
  var gender = RxnString();
  Rx<File?> selectedImage = Rx<File?>(null);

  // ============== Functions =============== //
  Future<void> pickImage() async {
    final file = await ImagePickerServices.pickImageFromGalerry();

    if (file != null) {
      selectedImage.value = file;
    }
  }

  Future<void> handleCompleteProfile() async {
    if (!completeprofilekey.currentState!.validate()) {
      return;
    }

    try {
      final user = completeProfileRepository.supabase.auth.currentUser;
      if (user == null) throw "User Not Found";

      await completeProfileRepository.createProfile(
        userId: user.id,
        email: user.email!,
        fullName: nameController.text,
        gender: gender.value!,
        photoFile: selectedImage.value,
      );

      await fcmTokenRepository.saveToken(user.id);

      CustomBottomSheet.singleBottomSheet(
        image: Assets.Ilustration_registerSuccess,
        title: "Your account successfully created",
        message:
            "Your account has successfully created. You can go to login page first to login into your account!",
        buttonText: "Yay! Continue",
        onPressed: () {
          toHome();
        },
      );
    } catch (e) {
      CustomSnackbar.failedSnackbar(e.toString());
    }
  }

  // =============== Navigator =============== //
  void toHome() => Get.offAllNamed(Routes.USER_HOME);
}
