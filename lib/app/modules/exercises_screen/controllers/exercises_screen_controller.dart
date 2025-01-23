import 'package:get/get.dart';
import 'package:fittmess/app/services/workoutController.dart';

class ExercisesScreenController extends GetxController {
  final WorkoutController workoutController = Get.find<WorkoutController>();
  final String styleId = Get.arguments['styleId'];
  RxBool isGridView = false.obs; // Toggle between ListView and GridView

  @override
  void onInit() {
    super.onInit();
    // Fetch exercises on screen initialization
    workoutController.getExercises(styleId);
  }

  List<dynamic> get exercises => workoutController.exercises;
  bool get isLoading => workoutController.isLoadingExercises.value;
  String get workoutStyleImageUrl {
    return workoutController.workoutStyles
        .firstWhere((style) => style['id'] == styleId)['image_url'];
  }

  String get workoutStyleName {
    return workoutController.workoutStyles
        .firstWhere((style) => style['id'] == styleId)['name'];
  }
  
}
