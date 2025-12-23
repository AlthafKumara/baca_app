import 'package:baca_app/A_newstructure/shared/models/profile_model.dart';
import 'package:baca_app/A_newstructure/shared/repositories/profile_repository.dart';
import 'package:baca_app/A_newstructure/shared/widgets/snackbar.dart';
import 'package:get/get.dart';

class UserFeedController extends GetxController {
  // ====================== Repository ======================
  final profileRepo = ProfileRepository();

  // ====================== Variable ======================
  Rxn<ProfileModel> profile = Rxn<ProfileModel>();

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

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
    loadUser();
  }

  @override
  void onClose() {
    super.onClose();
  }
}
