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

  String? validatorName(String? value) {
    if (value == null || value.isEmpty) {
      return "Please enter your name";
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

  String? validatorConfirmPassword(String? value, String? password) {
    if (value == null || value.isEmpty) {
      return "Please enter your confirm password";
    } else if (value != password) {
      return "Password didn't match!";
    }
    return null;
  }

  String? validatorTitle(String? value) {
    if (value == null || value.isEmpty) {
      return "Please enter your Title";
    }
    return null;
  }

  String? validatorSynopsis(String? value) {
    if (value == null || value.isEmpty) {
      return "Please enter your synopsis";
    }
    return null;
  }

  String? validatorAuthor(String? value) {
    if (value == null || value.isEmpty) {
      return "Please enter your author  ";
    }
    return null;
  }

  String? validatorStock(String? value) {
    if (value == "0") {
      return "Please enter the stock";
    }
    return null;
  }

  String? validatorPasswordChangeAuth(String? value) {
    if (value!.isNotEmpty && value.length < 6) {
      return "Password must be at least 6 characters";
    }
    return null;
  }

  String? validatorConfirmPasswordChangeAuth(String? value, String? password) {
    if (value != password) {
      return "Password didn't match!";
    }
    return null;
  }

  String? validatorListName(String? value) {
    if (value == null || value.isEmpty) {
      return "Please enter the saved list name";
    }
    return null;
  }

  String? validatorDescriptionReview(String? value) {
    return null;
  }
}
