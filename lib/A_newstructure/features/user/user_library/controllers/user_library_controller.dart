import 'package:baca_app/A_newstructure/configs/routes/route.dart';
import 'package:baca_app/A_newstructure/shared/models/profile_model.dart';
import 'package:baca_app/A_newstructure/shared/repositories/profile_repository.dart';
import 'package:baca_app/A_newstructure/shared/widgets/snackbar.dart';
import 'package:get/get.dart';

class UserLibraryController extends GetxController {
  // =============== Import ===============
  final profileRepo = ProfileRepository();

  // =============== Variable ===============
  Rxn<ProfileModel> profile = Rxn<ProfileModel>();

  // ============== Function ===============
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
    loadUser();
  }

  // ============== Navigator ===============

  void tosearch() => Get.toNamed(Routes.USER_SEARCH);
  void toCreateSavedList() => Get.toNamed(Routes.USER_CREATE_SAVED_LIST);
}
