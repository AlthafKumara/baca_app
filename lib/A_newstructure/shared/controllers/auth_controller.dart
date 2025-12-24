import 'package:baca_app/A_newstructure/configs/routes/route.dart';
import 'package:baca_app/A_newstructure/shared/repositories/auth_repository.dart';
import 'package:baca_app/A_newstructure/shared/widgets/snackbar.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class AuthController extends GetxController {
  // ================== IMPORTiNG =================
  final authRepo = AuthRepository();
  // ================== VARIABLES =================
  final changeAuhtkey = GlobalKey<FormState>();
  final adminchangeAuhtkey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmpasswordController = TextEditingController();
  var isObsecureText = true.obs;
  var isLoading = false.obs;
  // ================== FUNCTIONS =================

  Future<void> handleUpdateEmailPassword() async {
    if (!changeAuhtkey.currentState!.validate()) {
      return;
    }
    try {
      await authRepo.updateEmailPassword(
        emailController.text,
        passwordController.text,
      );
      CustomSnackbar.succesSnackbar("Email and password successfully updated");
      Get.offAllNamed(Routes.USER_PROFILE);
    } catch (e) {
      CustomSnackbar.failedSnackbar(e.toString());
    }
  }

  void handleObsecure() {
    isObsecureText.value = !isObsecureText.value;
  }

  Future<void> handleLogout() async {
    try {
      await authRepo.logout();
      CustomSnackbar.succesSnackbar("Logout success");
      Get.offAllNamed(Routes.LOGIN);
    } catch (e) {
      CustomSnackbar.failedSnackbar(e.toString());
    }
  }
}
