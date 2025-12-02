import 'package:baca_app/app/modules/auth/utils/existing_email.dart';
import 'package:get/get.dart';

class Validator {

  ExistingEmail existingEmail = ExistingEmail();
  String? validatorEmail(String? value) {
    if (value == null || value.isEmpty) {
      return "Please enter your email";
    } else if (!GetUtils.isEmail(value)) {
      return "Please enter a valid email";
    } 
    return null;
  }

  String? validatorPassword(String? value) {
    if (value == null || value.isEmpty) {
      return "Please enter your password";
    } else if (value.length < 6) {
      return "Password must be at least 6 characters";
    }
    return null;
  }

  String? validatorName(String? value) {
    if (value == null || value.isEmpty) {
      return "Please enter your name";
    }
    return null;
  }

  String? validatorConfirmPassword(String? value, String? password) {
    if (value == null || value.isEmpty) {
      return "Please enter your confirm password";
    } else if (value != password) {
      return "Password didn't match!";
    }
    return null;
  }

  String? validatorGender(String? value) {
    if (value == null || value.isEmpty) {
      return "Please enter your name";
    }
    return null;
  }
}
