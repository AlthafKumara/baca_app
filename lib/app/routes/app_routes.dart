part of 'app_pages.dart';
// DO NOT EDIT. This is code generated via package:get_cli/get_cli.dart

abstract class Routes {
  Routes._();
  // ----------------------------------------AUTH----------------------------
  static const AUTH = _Paths.AUTH;
  static const SPLASH = _Paths.SPLASH;
  static const ONBOARDING = _Paths.ONBOARDING;
  static const LOGIN = _Paths.LOGIN;
  static const REGISTER = _Paths.REGISTER;
  static const COMPLETE_PROFILE = _Paths.COMPLETE_PROFILE;

  // -------------------------------------------USER----------------------------
  static const HOME = _Paths.HOME;
  static const FEED = _Paths.FEED;
  static const LIBRARY = _Paths.LIBRARY;
  static const CREATE_SAVED_LIST = _Paths.CREATE_SAVED_LIST;
  static const DETAIL_BOOK = _Paths.DETAIL_BOOK;
  static const DETAIL_BORROW_BOOK = _Paths.DETAIL_BORROW_BOOK;
  static const PROFILE = _Paths.PROFILE;
  static const ACCOUNT_SETTING = _Paths.ACCOUNT_SETTING;
  static const CHANGE_AUTH = _Paths.CHANGE_AUTH;
  static const PERSONAL_DETAILS = _Paths.PERSONAL_DETAILS;

  // ----------------------------------------ADMIN----------------------------
  static const ADMIN_HOME = _Paths.ADMIN_HOME;
  static const ADMIN_LIBRARY = _Paths.ADMIN_LIBRARY;
  static const ADMIN_FORMBOOK = _Paths.ADMIN_FORMBOOK;
  static const ADMIN_BOOK_BORROW_DETAIL = _Paths.ADMIN_BOOK_BORROW_DETAIL;
  static const ADMIN_DETAIL_BOOK = _Paths.ADMIN_DETAIL_BOOK;
  static const ADMIN_PROFILE = _Paths.ADMIN_PROFILE;
  static const ADMIN_ACCOUNT_SETTING = _Paths.ADMIN_ACCOUNT_SETTING;
  static const ADMIN_CHANGE_AUTH = _Paths.ADMIN_CHANGE_AUTH;
  static const ADMIN_PERSONAL_DETAILS = _Paths.ADMIN_PERSONAL_DETAILS;
  static const BORROW = _Paths.BORROW;
  static const BOOK_BORROW_DETAIL = _Paths.BOOK_BORROW_DETAIL;
  static const ADMIN_SCAN = _Paths.ADMIN_SCAN;
  static const ADMIN_SEARCH = _Paths.ADMIN_SEARCH;
  static const SEARCH = _Paths.SEARCH;
}

abstract class _Paths {
  _Paths._();
  // ----------------------------------------AUTH-----------------------------
  static const AUTH = '/auth';
  static const SPLASH = '/splash';
  static const ONBOARDING = '/onboarding';
  static const LOGIN = '/login';
  static const REGISTER = '/register';
  static const COMPLETE_PROFILE = '/complete-profile';

  // ---------------------------------------------USER----------------------------
  static const HOME = '/home';
  static const FEED = '/feed';
  static const LIBRARY = '/library';
  static const CREATE_SAVED_LIST = '/create-saved-list';
  static const DETAIL_BOOK = '/detail-book';
  static const DETAIL_BORROW_BOOK = '/detail-borrow-book';
  static const PROFILE = '/profile';
  static const ACCOUNT_SETTING = '/account-setting';
  static const CHANGE_AUTH = '/change-auth';
  static const PERSONAL_DETAILS = '/personal-details';
  static const SEARCH = '/search';

  // ----------------------------------------ADMIN----------------------------
  static const ADMIN_HOME = '/admin-home';
  static const ADMIN_LIBRARY = '/admin-library';
  static const ADMIN_FORMBOOK = '/admin-formbook';
  static const ADMIN_DETAIL_BOOK = '/admin-detail-book';
  static const ADMIN_BOOK_BORROW_DETAIL = '/admin-book-borrow-detail';
  static const ADMIN_PROFILE = '/admin-profile';
  static const ADMIN_ACCOUNT_SETTING = '/admin-account-setting';
  static const ADMIN_CHANGE_AUTH = '/admin-change-auth';
  static const ADMIN_PERSONAL_DETAILS = '/admin-personal-details';
  static const BORROW = '/borrow';
  static const BOOK_BORROW_DETAIL = '/book-borrow-detail';
  static const ADMIN_SCAN = '/admin-scan';
  static const ADMIN_SEARCH = '/admin-search';
}
