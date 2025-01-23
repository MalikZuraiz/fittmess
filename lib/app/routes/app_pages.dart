import 'package:get/get.dart';

import '../modules/auth_screen/bindings/auth_screen_binding.dart';
import '../modules/auth_screen/views/auth_screen_view.dart';
import '../modules/detail_screen/bindings/detail_screen_binding.dart';
import '../modules/detail_screen/views/detail_screen_view.dart';
import '../modules/exercises_screen/bindings/exercises_screen_binding.dart';
import '../modules/exercises_screen/views/exercises_screen_view.dart';
import '../modules/home_screen/bindings/home_screen_binding.dart';
import '../modules/home_screen/views/home_screen_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.AUTH_SCREEN;

  static final routes = [
    GetPage(
      name: _Paths.HOME_SCREEN,
      page: () => HomeScreenView(),
      binding: HomeScreenBinding(),
    ),
    GetPage(
      name: _Paths.AUTH_SCREEN,
      page: () => AuthScreenView(),
      binding: AuthScreenBinding(),
    ),
    GetPage(
      name: _Paths.EXERCISES_SCREEN,
      page: () => ExercisesScreenView(
        styleId: Get.arguments['styleId'],
      ),
      binding: ExercisesScreenBinding(),
    ),
    GetPage(
      name: _Paths.DETAIL_SCREEN,
      page: () => DetailScreenView(
        exercise: Get.arguments['exercise'],    
      ),
      binding: DetailScreenBinding(),
    ),
  ];
}
