import 'package:baca_app/A_newstructure/configs/routes/route.dart';
import 'package:baca_app/A_newstructure/features/auth/register/repositories/register_repository.dart';
import 'package:baca_app/A_newstructure/shared/widgets/snackbar.dart';
import 'package:baca_app/A_newstructure/utils/functions/existing_email.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class RegisterController extends GetxController {
  // ====================== Repo ====================== //
  final registerRepository = RegisterRepository();

  // ====================== Variable ====================== //
  final registerKey = GlobalKey<FormState>();

  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmpasswordController = TextEditingController();

  final ExistingEmail availableEmail = ExistingEmail();
  var isObsecureText = true.obs;

  // ====================== Function ====================== //

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

    if (!registerKey.currentState!.validate()) {
      return;
    }

    if (!available) {
      CustomSnackbar.failedSnackbar("Email already exist");
      return;
    }

    try {
      registerRepository.register(
        emailController.text,
        passwordController.text,
      );
      toCompleteProfile();
    } catch (e) {
      CustomSnackbar.failedSnackbar(e.toString());
    }
  }

  // ====================== Navigator ====================== //
  void toCompleteProfile() => Get.offNamed(Routes.COMPLETE_PROFILE);
  void toLogin() => Get.offNamed(Routes.LOGIN);
}
