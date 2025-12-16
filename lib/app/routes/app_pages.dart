import 'package:baca_app/app/modules/user/feed/views/add_feed_view.dart';
import 'package:get/get.dart';

import '../modules/admin/admin_book_borrow_detail/bindings/admin_book_borrow_detail_binding.dart';
import '../modules/admin/admin_book_borrow_detail/views/admin_book_borrow_detail_view.dart';
import '../modules/admin/admin_home/bindings/admin_home_binding.dart';
import '../modules/admin/admin_home/views/admin_home_view.dart';
import '../modules/admin/admin_library/bindings/admin_library_binding.dart';
import '../modules/admin/admin_library/views/admin_detail_book_view.dart';
import '../modules/admin/admin_library/views/admin_formbook_view.dart';
import '../modules/admin/admin_library/views/admin_library_view.dart';
import '../modules/admin/admin_profile/bindings/admin_profile_binding.dart';
import '../modules/admin/admin_profile/views/admin_account_setting_view.dart';
import '../modules/admin/admin_profile/views/admin_change_auth_view.dart';
import '../modules/admin/admin_profile/views/admin_personal_detail_view.dart';
import '../modules/admin/admin_profile/views/admin_profile_view.dart';
import '../modules/admin/admin_scan/bindings/admin_scan_binding.dart';
import '../modules/admin/admin_scan/views/admin_scan_view.dart';
import '../modules/admin/admin_search/bindings/admin_search_binding.dart';
import '../modules/admin/admin_search/views/admin_search_view.dart';
import '../modules/auth/bindings/auth_binding.dart';
import '../modules/auth/views/complete_profile_view.dart';
import '../modules/auth/views/login_view.dart';
import '../modules/auth/views/onboarding_view.dart';
import '../modules/auth/views/register_view.dart';
import '../modules/auth/views/splash_view.dart';
import '../modules/user/search/bindings/search_binding.dart';
import '../modules/user/search/views/search_view.dart';
import '../modules/user/book_borrow_detail/bindings/book_borrow_detail_binding.dart';
import '../modules/user/book_borrow_detail/views/book_borrow_detail_view.dart';
import '../modules/user/book_detail/bindings/book_detail_binding.dart';
import '../modules/user/book_detail/views/book_detail_view.dart';
import '../modules/user/feed/bindings/feed_binding.dart';
import '../modules/user/feed/views/feed_view.dart';
import '../modules/user/home/bindings/home_binding.dart';
import '../modules/user/home/views/home_view.dart';
import '../modules/user/library/bindings/library_binding.dart';
import '../modules/user/library/views/create_saved_list_view.dart';
import '../modules/user/library/views/library_view.dart';
import '../modules/user/profile/bindings/profile_binding.dart';
import '../modules/user/profile/views/account_setting_view.dart';
import '../modules/user/profile/views/change_auth_view.dart';
import '../modules/user/profile/views/personal_details_view.dart';
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
      name: _Paths.ADD_FEED,
      page: () => AddFeedView(),
      binding: FeedBinding(),
    ),
    GetPage(
      name: _Paths.LIBRARY,
      page: () => LibraryView(),
      binding: LibraryBinding(),
    ),
    GetPage(
      name: _Paths.CREATE_SAVED_LIST,
      page: () => CreateSavedListView(),
      binding: LibraryBinding(),
    ),
    GetPage(
      name: _Paths.DETAIL_BORROW_BOOK,
      page: () => BookBorrowDetailView(),
      binding: LibraryBinding(),
    ),
    GetPage(
      name: _Paths.DETAIL_BOOK,
      page: () => BookDetailView(),
      binding: BookDetailBinding(),
    ),
    GetPage(
      name: _Paths.PROFILE,
      page: () => ProfileView(),
      binding: ProfileBinding(),
    ),
    GetPage(
      name: _Paths.ACCOUNT_SETTING,
      page: () => AccountSettingView(),
      binding: ProfileBinding(),
    ),

    GetPage(
      name: _Paths.CHANGE_AUTH,
      page: () => ChangeAuthView(),
      binding: ProfileBinding(),
    ),

    GetPage(
      name: _Paths.PERSONAL_DETAILS,
      page: () => PersonalDetailsView(),
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
      name: _Paths.BOOK_BORROW_DETAIL,
      page: () => BookBorrowDetailView(),
      binding: BookBorrowDetailBinding(),
    ),
    GetPage(
      name: _Paths.ADMIN_DETAIL_BOOK,
      page: () => AdminDetailBookView(),
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

    GetPage(
      name: _Paths.ADMIN_ACCOUNT_SETTING,
      page: () => AdminAccountSettingView(),
      binding: AdminProfileBinding(),
    ),

    GetPage(
      name: _Paths.ADMIN_CHANGE_AUTH,
      page: () => AdminChangeAuthView(),
      binding: AdminProfileBinding(),
    ),
    GetPage(
      name: _Paths.ADMIN_PERSONAL_DETAILS,
      page: () => AdminPersonalDetailView(),
      binding: AdminProfileBinding(),
    ),
    GetPage(
      name: _Paths.ADMIN_BOOK_BORROW_DETAIL,
      page: () => const AdminBookBorrowDetailView(),
      binding: AdminBookBorrowDetailBinding(),
    ),
    GetPage(
      name: _Paths.ADMIN_SCAN,
      page: () => const AdminScanView(),
      binding: AdminScanBinding(),
    ),
    GetPage(
      name: _Paths.ADMIN_SEARCH,
      page: () => AdminSearchView(),
      binding: AdminSearchBinding(),
    ),
    GetPage(
      name: _Paths.SEARCH,
      page: () => SearchView(),
      binding: SearchBinding(),
    ),
  ];
}
