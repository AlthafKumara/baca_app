import 'package:get/get.dart';

class Validator {
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
}
