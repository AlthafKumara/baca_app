import 'package:baca_app/A_newstructure/configs/routes/route.dart';
import 'package:baca_app/A_newstructure/features/admin/admin_home/bindings/admin_home_binding.dart';
import 'package:baca_app/A_newstructure/features/admin/admin_home/view/ui/admin_home_view.dart';
import 'package:baca_app/A_newstructure/features/auth/complete_profile/bindings/complete_profile_binding.dart';
import 'package:baca_app/A_newstructure/features/auth/complete_profile/view/ui/complete_profile_view.dart';
import 'package:baca_app/A_newstructure/features/auth/login/bindings/login_binding.dart';
import 'package:baca_app/A_newstructure/features/auth/login/view/ui/login_view.dart';
import 'package:baca_app/A_newstructure/features/auth/onboarding/bindings/onboarding_binding.dart';
import 'package:baca_app/A_newstructure/features/auth/onboarding/view/ui/onboarding_view.dart';
import 'package:baca_app/A_newstructure/features/auth/register/bindings/register_binding.dart';
import 'package:baca_app/A_newstructure/features/auth/register/view/ui/register_view.dart';
import 'package:baca_app/A_newstructure/features/auth/splash/bindings/splash_binding.dart';
import 'package:baca_app/A_newstructure/features/auth/splash/view/ui/splash_view.dart';
import 'package:baca_app/A_newstructure/features/user/user_book_detail/bindings/user_book_detail_binding.dart';
import 'package:baca_app/A_newstructure/features/user/user_book_detail/view/ui/user_book_detail_view.dart';
import 'package:baca_app/A_newstructure/features/user/user_feed/bindings/user_feed_binding.dart';
import 'package:baca_app/A_newstructure/features/user/user_feed/view/ui/user_feed_view.dart';
import 'package:baca_app/A_newstructure/features/user/user_home/bindings/user_home_binding.dart';
import 'package:baca_app/A_newstructure/features/user/user_home/view/ui/user_home_view.dart';
import 'package:baca_app/A_newstructure/features/user/user_library/bindings/user_library_binding.dart';
import 'package:baca_app/A_newstructure/features/user/user_library/view/ui/user_library_view.dart';
import 'package:baca_app/A_newstructure/features/user/user_profile/bindings/user_profile_binding.dart';
import 'package:baca_app/A_newstructure/features/user/user_profile/view/ui/user_profile_view.dart';
import 'package:baca_app/A_newstructure/shared/bindings/user_binding.dart';
import 'package:get/get.dart';

class CustomPage {
  CustomPage._();

  static const INITIAL = Routes.SPLASH;

  static final routes = [
    // ======================== AUTH ======================== //
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
      name: Routes.REGISTER,
      page: () => RegisterView(),
      binding: RegisterBinding(),
    ),

    GetPage(
      name: Routes.COMPLETE_PROFILE,
      page: () => CompleteProfileView(),
      binding: CompleteProfileBinding(),
    ),

    // ======================== USER ======================== //
    GetPage(
      name: Routes.USER_HOME,
      page: () => UserHomeView(),
      bindings: [UserHomeBinding(), UserBinding()],
    ),
    GetPage(
      name: Routes.USER_FEED,
      page: () => UserFeedView(),
      bindings: [UserFeedBinding(), UserBinding()],
    ),
    GetPage(
      name: Routes.USER_LIBRARY,
      page: () => UserLibraryView(),
      bindings: [UserLibraryBinding(), UserBinding()],
    ),
    GetPage(
      name: Routes.USER_PROFILE,
      page: () => UserProfileView(),
      bindings: [UserProfileBinding(), UserBinding()],
    ),
    GetPage(
      name: Routes.USER_BOOK_DETAIL,
      page: () => UserBookDetailView(),
      binding: UserBookDetailBinding(),
    ),

    // ======================= ADMIN ======================== //
    GetPage(
      name: Routes.ADMIN_HOME,
      page: () => AdminHomeView(),
      binding: AdminHomeBinding(),
    ),
  ];
}
