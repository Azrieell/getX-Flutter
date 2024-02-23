part of 'app_pages.dart';

abstract class Routes {
  Routes._();
  static const HOME = _Paths.HOME;
  static const PROFILE = _Paths.PROFILE;
  static const COUNTER = _Paths.COUNTER;
  static const FORMULIR = _Paths.FORMULIR;
  static const BIODATA = _Paths.BIODATA;
  static const LATIHANFORM = _Paths.LATIHANFORM;
  static const LOGIN = _Paths.LOGIN;
  static const REGISTER = _Paths.REGISTER;
  static const CATEGORI = _Paths.CATEGORI;
  static const BOTTOM_MENU = _Paths.BOTTOM_MENU;
}

abstract class _Paths {
  _Paths._();
  static const HOME = '/home';
  static const PROFILE = '/profile';
  static const COUNTER = '/counter';
  static const FORMULIR = '/formulir';
  static const BIODATA = '/biodata';
  static const LATIHANFORM = '/latihanform';
  static const LOGIN = '/login';
  static const REGISTER = '/register';
  static const CATEGORI = '/categori';
  static const String TAMBAHCATEGORI = '/categori/add';
  static const String EDITCATEGORI = '/categori/edit';
  static const String DETAILCATEGORI = '/categori/edit';
  static const BOTTOM_MENU = '/bottom-menu';
}
