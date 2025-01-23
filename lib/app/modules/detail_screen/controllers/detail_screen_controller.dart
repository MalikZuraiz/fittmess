import 'package:get/get.dart';

class DetailScreenController extends GetxController {
  // Controller can hold data related to the exercise
  final RxMap<dynamic, dynamic> exercise = {}.obs;

  @override
  void onInit() {
    super.onInit();
    // Initialize any logic for the exercise
  }

  void setExercise(Map<String, dynamic> newExercise) {
    exercise.value = newExercise;
  }
}
