abstract class Routes {
  Routes._();
  // ----------------------------------------AUTH----------------------------

  static const SPLASH = _Paths.SPLASH;
  static const ONBOARDING = _Paths.ONBOARDING;
  static const LOGIN = _Paths.LOGIN;
  static const REGISTER = _Paths.REGISTER;
  static const COMPLETE_PROFILE = _Paths.COMPLETE_PROFILE;

  // -------------------------------------------USER----------------------------

  static const USER_HOME = _Paths.USER_HOME;
  static const USER_FEED = _Paths.USER_FEED;
  static const USER_PROFILE = _Paths.USER_PROFILE;
  static const USER_LIBRARY = _Paths.USER_LIBRARY;
  static const USER_BOOK_DETAIL = _Paths.USER_BOOK_DETAIL;

  // ----------------------------------------ADMIN----------------------------

  static const ADMIN_HOME = _Paths.ADMIN_HOME;
}

abstract class _Paths {
  _Paths._();
  // ----------------------------------------AUTH-----------------------------

  static const SPLASH = '/splash';
  static const ONBOARDING = '/onboarding';
  static const LOGIN = '/login';
  static const REGISTER = '/register';
  static const COMPLETE_PROFILE = '/complete-profile';

  // ------------------------USER-------------------------

  static const USER_HOME = '/user_home';
  static const USER_FEED = '/user_feed';
  static const USER_PROFILE = '/user_profile';
  static const USER_LIBRARY = '/user_library';
  static const USER_BOOK_DETAIL = '/user_book_detail';

  // ----------------------------------------ADMIN----------------------------

  static const ADMIN_HOME = '/admin_home';
}
