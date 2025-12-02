import 'package:baca_app/app/modules/auth/views/complete_profile_view.dart';
import 'package:baca_app/app/modules/auth/views/login_view.dart';
import 'package:baca_app/app/modules/auth/views/onboarding_view.dart';
import 'package:baca_app/app/modules/auth/views/register_view.dart';
import 'package:baca_app/app/modules/auth/views/splash_view.dart';
import 'package:get/get.dart';

import '../modules/auth/bindings/auth_binding.dart';

import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.SPLASH;

  static final routes = [
    // ------------------------------------------- AUTH--------------------------------------------
    GetPage(
      name: _Paths.SPLASH,
      page: () => SplashView(),
      binding: AuthBinding(),
    ),

    GetPage(
      name: _Paths.ONBOARDING,
      page: () => const OnboardingView(),
      binding: AuthBinding(),
    ),

    GetPage(
      name: _Paths.LOGIN,
      page: () => LoginView(),
      binding: AuthBinding(),
    ),

    GetPage(
      name: _Paths.REGISTER,
      page: () => RegisterView(),
      binding: AuthBinding(),
    ),

    GetPage(
      name: _Paths.COMPLETE_PROFILE,
      page: () => CompleteProfileView(),
      binding: AuthBinding(),
    ),

    // ------------------------------------------- HOME--------------------------------------------
    GetPage(
      name: _Paths.HOME,
      page: () => const HomeView(),
      binding: HomeBinding(),
    ),
  ];
}
