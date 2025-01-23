import 'package:get/get.dart';

import '../controllers/exercises_screen_controller.dart';

class ExercisesScreenBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ExercisesScreenController>(
      () => ExercisesScreenController(),
    );
  }
}
