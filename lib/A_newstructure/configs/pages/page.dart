import 'package:baca_app/A_laststructure/app/modules/auth/views/splash_view.dart';
import 'package:baca_app/A_newstructure/configs/routes/route.dart';
import 'package:baca_app/A_newstructure/features/auth/complete_profile/view/ui/complete_profile_view.dart';
import 'package:baca_app/A_newstructure/features/auth/login/bindings/login_binding.dart';
import 'package:baca_app/A_newstructure/features/auth/onboarding/bindings/onboarding_binding.dart';
import 'package:baca_app/A_newstructure/features/auth/onboarding/view/ui/onboarding_view.dart';
import 'package:baca_app/A_newstructure/features/auth/splash/bindings/splash_binding.dart';
import 'package:get/get.dart';

class Page {
  Page._();

  static const INITIAL = Routes.SPLASH;

  static final routes = [
    GetPage(
      name: Routes.SPLASH,
      page: () => SplashView(),
      binding: SplashBinding(),
    ),

    GetPage(
      name: Routes.ONBOARDING,
      page: () => OnboardingView(),
      binding: OnboardingBinding(),
    ),
    GetPage(
      name: Routes.LOGIN,
      page: () => LoginView(),
      binding: LoginBinding(),
    ),
    GetPage(
      name: Routes.ONBOARDING,
      page: () => OnboardingView(),
      binding: OnboardingBinding(),
    ),
  ];
}
