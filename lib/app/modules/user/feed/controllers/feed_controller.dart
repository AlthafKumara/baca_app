import 'package:baca_app/app/core/widget/snackbar.dart';
import 'package:baca_app/app/data/model/profiles_model.dart';
import 'package:baca_app/app/data/services/profile_services.dart';
import 'package:get/get.dart';

class FeedController extends GetxController {
  Rxn<Profile> profile = Rxn<Profile>();
  ProfileServices profileServices = ProfileServices();

  Future<void> loadUser() async {
    try {
      await profileServices.loadProfile().then(
        (value) => profile.value = Profile.fromMap(value!),
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
