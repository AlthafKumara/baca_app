import 'package:baca_app/A_newstructure/configs/routes/route.dart';
import 'package:baca_app/A_newstructure/shared/models/book_model.dart';
import 'package:baca_app/A_newstructure/shared/models/profile_model.dart';
import 'package:baca_app/A_newstructure/shared/repositories/profile_repository.dart';
import 'package:baca_app/A_newstructure/shared/widgets/snackbar.dart';
import 'package:get/get.dart';

class UserBookDetailController extends GetxController {
  // ==================== Import ==================== //
  final profileRepository = ProfileRepository();
  // ==================== Variable ==================== //
  Rxn<ProfileModel> profile = Rxn<ProfileModel>();
  // ==================== Function ==================== //

  Future<void> loadUser() async {
    try {
      await profileRepository.loadProfile().then(
        (value) => profile.value = ProfileModel.fromMap(value!),
      );
    } catch (e) {
      CustomSnackbar.failedSnackbar(e.toString());
    }
  }

  @override
  void onInit() {
    loadUser();
    super.onInit();
  }

  // ==================== Navigation ==================== //
  void toBookDetail({required BookModel book}) =>
      Get.toNamed(Routes.USER_BOOK_DETAIL, arguments: book);
}
