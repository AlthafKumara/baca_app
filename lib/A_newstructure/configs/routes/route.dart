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
  static const USER_DETAIL_FEED = _Paths.USER_DETAIL_FEED;
  static const USER_ADD_FEED = _Paths.USER_ADD_FEED;
  static const USER_REPLY_FEED = _Paths.USER_REPLY_FEED;
  static const USER_PROFILE = _Paths.USER_PROFILE;
  static const USER_LIBRARY = _Paths.USER_LIBRARY;
  static const USER_BOOK_DETAIL = _Paths.USER_BOOK_DETAIL;
  static const USER_BOOK_BORROW_DETAIL = _Paths.USER_BOOK_BORROW_DETAIL;
  static const USER_CREATE_SAVED_LIST = _Paths.USER_CREATE_SAVED_LIST;
  static const USER_SEARCH = _Paths.USER_SEARCH;
  static const USER_PERSONAL_DETAIL = _Paths.USER_PERSONAL_DETAIL;
  static const USER_CHANGE_AUTH = _Paths.USER_CHANGE_AUTH;
  static const USER_ACCOUNT_SETTING = _Paths.USER_ACCOUNT_SETTING;

  // ----------------------------------------ADMIN----------------------------

  static const ADMIN_HOME = _Paths.ADMIN_HOME;

  // ============================ GLOBAL ==========================;
  static const NOTIFICATION = _Paths.NOTIFICATION;
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
  static const USER_DETAIL_FEED = '/user_detail_feed';
  static const USER_ADD_FEED = '/user_add_feed';
  static const USER_REPLY_FEED = '/user_reply_feed';
  static const USER_PROFILE = '/user_profile';
  static const USER_LIBRARY = '/user_library';
  static const USER_BOOK_DETAIL = '/user_book_detail';
  static const USER_BOOK_BORROW_DETAIL = '/user_book_borrow_detail';
  static const USER_CREATE_SAVED_LIST = '/user_create_saved_list';
  static const USER_SEARCH = '/user_search';
  static const USER_PERSONAL_DETAIL = '/user_personal_detail';
  static const USER_CHANGE_AUTH = '/user_change_auth';
  static const USER_ACCOUNT_SETTING = '/user_account_setting';

  // ----------------------------------------ADMIN----------------------------

  static const ADMIN_HOME = '/admin_home';

  // ============================ GLOBAL ==========================;
  static const NOTIFICATION = '/notification';
}
