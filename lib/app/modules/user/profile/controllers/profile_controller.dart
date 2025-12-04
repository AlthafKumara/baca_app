  import 'package:baca_app/app/core/widget/snackbar.dart';
  import 'package:baca_app/app/data/model/profiles_model.dart';
  import 'package:baca_app/app/routes/app_pages.dart';
  import 'package:get/get.dart';
  import 'package:supabase_flutter/supabase_flutter.dart';

  class ProfileController extends GetxController {
    final supabase = Supabase.instance.client;

    Rxn<Profile> profile = Rxn<Profile>();
    Future<void> loadUser() async {
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
          CustomSnackbar.failedSnackbar("Failed to load user profile");
          return;
        } else {
          final userProfile = Profile.fromMap(response);
          profile.value = userProfile;
        }
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
