import 'package:fittmess/app/services/supabaseService.dart';
import 'package:get/get.dart';

class WorkoutController extends GetxController {
  final SupabaseService _supabaseService = Get.find<SupabaseService>();

  // Observables
  var categories = <Map<String, dynamic>>[].obs;
  var workoutStyles = <Map<String, dynamic>>[].obs;
  var selectedCategoryId = ''.obs; // Stores the currently selected category ID
  var exercises = <Map<String, dynamic>>[].obs;
  var isLoadingExercises = false.obs;

  var isLoading = false.obs;

  @override
  void onInit() {
    fetchCategories(); // Fetch categories on initialization
    super.onInit();
  }

  // Fetch all categories (Beginner, Intermediate, Advanced)
  Future<void> fetchCategories() async {
    isLoading.value = true;
    try {
      final response = await _supabaseService
          .fetchCategories(); // Create fetchCategories in the Supabase service
      categories.value = response;
      if (categories.isNotEmpty) {
        selectedCategoryId.value =
            categories[0]['id']; // Default to the first category
        getWorkoutStyles(selectedCategoryId.value);
      }
    } finally {
      isLoading.value = false;
    }
  }

  // Fetch workout styles for the selected category
  Future<void> getWorkoutStyles(String categoryId) async {
    isLoading.value = true;
    try {
      final styles =
          await _supabaseService.fetchWorkoutStylesByLevel(categoryId);
      workoutStyles.value = styles;
    } finally {
      isLoading.value = false;
    }
  }

  // Fetch exercises for a specific workout style
  Future<void> getExercises(String styleId) async {
    isLoading.value = true;
    try {
      final exercisesList =
          await _supabaseService.fetchExercisesByStyle(styleId);
      exercises.value = exercisesList;
    } finally {
      isLoading.value = false;
    }
  }
}
