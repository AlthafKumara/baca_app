import 'package:baca_app/app/modules/admin/admin_library/views/admin_formbook_view.dart';
import 'package:get/get.dart';

import '../modules/admin/admin_home/bindings/admin_home_binding.dart';
import '../modules/admin/admin_home/views/admin_home_view.dart';
import '../modules/admin/admin_library/bindings/admin_library_binding.dart';
import '../modules/admin/admin_library/views/admin_library_view.dart';
import '../modules/admin/admin_profile/bindings/admin_profile_binding.dart';
import '../modules/admin/admin_profile/views/admin_profile_view.dart';
import '../modules/auth/bindings/auth_binding.dart';
import '../modules/auth/views/complete_profile_view.dart';
import '../modules/auth/views/login_view.dart';
import '../modules/auth/views/onboarding_view.dart';
import '../modules/auth/views/register_view.dart';
import '../modules/auth/views/splash_view.dart';
import '../modules/user/feed/bindings/feed_binding.dart';
import '../modules/user/feed/views/feed_view.dart';
import '../modules/user/home/bindings/home_binding.dart';
import '../modules/user/home/views/home_view.dart';
import '../modules/user/library/bindings/library_binding.dart';
import '../modules/user/library/views/library_view.dart';
import '../modules/user/profile/bindings/profile_binding.dart';
import '../modules/user/profile/views/profile_view.dart';

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
      page: () => OnboardingView(),
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

    // ------------------------------------------- USER--------------------------------------------
    GetPage(name: _Paths.HOME, page: () => HomeView(), binding: HomeBinding()),

    GetPage(name: _Paths.FEED, page: () => FeedView(), binding: FeedBinding()),
    GetPage(
      name: _Paths.LIBRARY,
      page: () => LibraryView(),
      binding: LibraryBinding(),
    ),
    GetPage(
      name: _Paths.PROFILE,
      page: () => ProfileView(),
      binding: ProfileBinding(),
    ),

    // ------------------------------------------- ADMIN--------------------------------------------
    GetPage(
      name: _Paths.ADMIN_HOME,
      page: () => AdminHomeView(),
      binding: AdminHomeBinding(),
    ),
    GetPage(
      name: _Paths.ADMIN_LIBRARY,
      page: () => AdminLibraryView(),
      binding: AdminLibraryBinding(),
    ),
    GetPage(
      name: _Paths.ADMIN_FORMBOOK,
      page: () => AdminFormbookView(),
      binding: AdminLibraryBinding(),
    ),
    GetPage(
      name: _Paths.ADMIN_PROFILE,
      page: () => AdminProfileView(),
      binding: AdminProfileBinding(),
    ),
  ];
}
