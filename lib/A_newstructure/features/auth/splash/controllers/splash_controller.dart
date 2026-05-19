import 'package:baca_app/A_newstructure/configs/routes/route.dart';
import 'package:baca_app/A_newstructure/shared/repositories/profile_repository.dart';
import 'package:baca_app/A_newstructure/utils/enums/profiles_enum.dart';
import 'package:baca_app/A_newstructure/utils/services/notification_services.dart';
import 'package:get/get.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class SplashController extends GetxController {
  final profileRepository = ProfileRepository();

  // ===============Navigation================
  void toOnboarding() => Get.offNamed(Routes.ONBOARDING);
  void toHomeAdmin() {
    Get.offAllNamed(Routes.ADMIN_HOME);
  }

  void toHomeUser() {
    Get.offAllNamed(Routes.USER_HOME);
  }
  // ==============FUNCTIONS==================

  @override
  void onInit() {
    super.onInit();
    print('SPLASH onReady CALLED');
    _checkSession();
  }

  Future<void> _checkSession() async {
    await Future.delayed(const Duration(seconds: 2));

    final session = Supabase.instance.client.auth.currentSession;

    if (session != null) {
      final profile = await profileRepository.loadProfile();
      final pendingNotificationData =
          NotificationService.pendingNotificationData;

      if (profile == null) {
        Get.offAllNamed(Routes.COMPLETE_PROFILE);
      }

      final role = profile?['role'];

      if (pendingNotificationData != null) {
        NotificationService.pendingNotificationData = null;

        if (role == Role.admin.name) {
          toHomeAdmin();
          NotificationService.navigateByType(pendingNotificationData);
        } else {
          toHomeUser();
          NotificationService.navigateByType(pendingNotificationData);
        }
      } else {
        if (role == Role.admin.name) {
          toHomeAdmin();
        } else {
          toHomeUser();
        }
      }
    } else {
      toOnboarding();
    }
  }
}
