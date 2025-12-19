abstract class Routes {
  Routes._();
  // ----------------------------------------AUTH----------------------------

  static const SPLASH = _Paths.SPLASH;
  static const ONBOARDING = _Paths.ONBOARDING;
  static const LOGIN = _Paths.LOGIN;
  static const REGISTER = _Paths.REGISTER;
  static const COMPLETE_PROFILE = _Paths.COMPLETE_PROFILE;

  // -------------------------------------------USER----------------------------

  // ----------------------------------------ADMIN----------------------------
}

abstract class _Paths {
  _Paths._();
  // ----------------------------------------AUTH-----------------------------

  static const SPLASH = '/splash';
  static const ONBOARDING = '/onboarding';
  static const LOGIN = '/login';
  static const REGISTER = '/register';
  static const COMPLETE_PROFILE = '/complete-profile';

  // ---------------------------------------------USER----------------------------

  // ----------------------------------------ADMIN----------------------------
}
