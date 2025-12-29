import 'package:baca_app/A_newstructure/features/user/user_feed/controllers/get_feed_controller.dart';
import 'package:baca_app/A_newstructure/shared/models/profile_model.dart';
import 'package:baca_app/A_newstructure/shared/repositories/profile_repository.dart';
import 'package:baca_app/A_newstructure/shared/widgets/snackbar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class UserFeedController extends GetxController {
  // ====================== Repository ======================
  final profileRepo = ProfileRepository();
  final feedC = Get.find<GetFeedController>();

  // ====================== Variable ======================
  Rxn<ProfileModel> profile = Rxn<ProfileModel>();

  final searchController = TextEditingController();

  // ====================== Function ======================
  Future<void> loadUser() async {
    try {
      await profileRepo.loadProfile().then(
        (value) => profile.value = ProfileModel.fromMap(value!),
      );
    } catch (e) {
      CustomSnackbar.failedSnackbar(e.toString());
    }
  }

  void searchChanged() {
    feedC.filterFeed(searchController.text.trim());
  }

  @override
  void onInit() {
    super.onInit();
    searchController.addListener(searchChanged);
  }

  @override
  void onReady() {
    super.onReady();
    loadUser();
  }

  @override
  void onClose() {
    searchController.dispose();
    super.onClose();
  }
}
