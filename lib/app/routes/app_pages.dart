import 'package:get/get.dart';

import '../middleware/auth_middleware.dart';
import '../modules/biodata/bindings/biodata_binding.dart';
import '../modules/biodata/views/biodata_view.dart';
import '../modules/bottom_menu/bindings/bottom_menu_binding.dart';
import '../modules/bottom_menu/views/bottom_menu_view.dart';
import '../modules/categori/bindings/categori_binding.dart';
import '../modules/categori/views/categori_view.dart';
import '../modules/categori/views/create_categori.dart';
import '../modules/categori/views/create_categori.dart';
import '../modules/categori/views/edit_categori_view.dart';
import '../modules/categori/views/edit_categori_view.dart';
import '../modules/categori/views/show_categori_view.dart';
import '../modules/counter/bindings/counter_binding.dart';
import '../modules/counter/views/counter_view.dart';
import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';
import '../modules/latihanform/bindings/latihanform_binding.dart';
import '../modules/latihanform/views/latihanform_view.dart';
import '../modules/login/bindings/login_binding.dart';
import '../modules/login/views/login_view.dart';
import '../modules/profile/bindings/profile_binding.dart';
import '../modules/profile/views/profile_view.dart';
import '../modules/register/bindings/register_binding.dart';
import '../modules/register/views/register_view.dart';

// import 'package:pettycashpall/app/modules/bottom_menu/bindings/bottom_menu_binding.dart';
// import 'package:pettycashpall/app/modules/bottom_menu/views/bottom_menu_view.dart';
// import 'package:pettycashpall/app/modules/categori/bindings/categori_binding.dart';
// import 'package:pettycashpall/app/modules/categori/views/show_categori_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.BOTTOM_MENU;

  static final routes = [
    GetPage(
        name: _Paths.HOME,
        page: () => HomeView(),
        binding: HomeBinding(),
        middlewares: [AuthMiddleware()]),
    GetPage(
      name: _Paths.PROFILE,
      page: () => ProfileView(),
      binding: ProfileBinding(),
    ),
    GetPage(
      name: _Paths.COUNTER,
      page: () => CounterView(),
      binding: CounterBinding(),
    ),
    GetPage(
      name: _Paths.BIODATA,
      page: () => BiodataView(),
      binding: BiodataBinding(),
    ),
    GetPage(
      name: _Paths.LATIHANFORM,
      page: () => LatihanformView(),
      binding: LatihanformBinding(),
    ),
    GetPage(
      name: _Paths.LOGIN,
      page: () => LoginView(),
      binding: LoginBinding(),
    ),
    GetPage(
      name: _Paths.REGISTER,
      page: () => RegisterView(),
      binding: RegisterBinding(),
    ),
    GetPage(
      name: _Paths.CATEGORI,
      page: () => CategoriView(),
      binding: CategoriBinding(),
    ),
    GetPage(
      name: _Paths.TAMBAHCATEGORI,
      page: () => TambahCategoriView(),
    ),
    GetPage(
      name: _Paths.EDITCATEGORI,
      page: () => EditCategoriView(categori: Get.arguments),
    ),
    GetPage(
      name: _Paths.DETAILCATEGORI,
      page: () => DetailCategoriView(categori: Get.arguments),
    ),
    GetPage(
      name: _Paths.BOTTOM_MENU,
      page: () =>  BottomMenuView(),
      binding: BottomMenuBinding(),
    ),
  ];
}
