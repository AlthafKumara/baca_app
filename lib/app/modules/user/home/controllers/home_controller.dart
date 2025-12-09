import 'package:baca_app/app/core/widget/snackbar.dart';
import 'package:baca_app/app/data/model/book_model.dart';
import 'package:baca_app/app/data/model/profiles_model.dart';
import 'package:baca_app/app/data/services/book_services.dart';
import 'package:baca_app/app/routes/app_pages.dart';
import 'package:get/get.dart';

import 'package:supabase_flutter/supabase_flutter.dart';

class HomeController extends GetxController with StateMixin<dynamic> {
  final supabase = Supabase.instance.client;

  BookServices bookservices = BookServices();

  

  Rxn<Profile> profile = Rxn<Profile>();
  var loaded = false.obs;
  Future<void> loadUser() async {
    if (loaded.value) return;
    loaded.value = true;
    try {
      final user = supabase.auth.currentUser;

      if (user == null) {
        CustomSnackbar.failedSnackbar("User not found");
      }

      final response = await supabase
          .from('profiles')
          .select()
          .eq('id', user!.id)
          .maybeSingle();
      if (response == null) {
        CustomSnackbar.failedSnackbar("Insert your profile first");
        Get.offAllNamed(Routes.COMPLETE_PROFILE);
        return;
      } else {
        final userProfile = Profile.fromMap(response);
        profile.value = userProfile;
      }
    } catch (e) {
      CustomSnackbar.failedSnackbar(e.toString());
    }
  }

  

  final count = 0.obs;
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

  void increment() => count.value++;
}
