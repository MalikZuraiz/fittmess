import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:fittmess/app/services/workoutController.dart';
import 'package:fittmess/app/services/supabaseService.dart';

class HomeScreenController extends GetxController {
  final WorkoutController workoutController = Get.put(WorkoutController());
  final SupabaseService supabaseService = Get.find<SupabaseService>();

  var isGridView = false.obs;
  var selectedCategoryId = ''.obs;
  var isLoading = false.obs;

  List<dynamic> get categories => workoutController.categories;
  List<dynamic> get workoutStyles => workoutController.workoutStyles;

  @override
  void onInit() {
    super.onInit();
    loadCategories();
  }

  Future<void> loadCategories() async {
    try {
      isLoading(true);
      await workoutController.fetchCategories();
      
      if (categories.isNotEmpty) {
        selectCategory(categories.first);
      }
    } finally {
      isLoading(false);
    }
  }

  void selectCategory(dynamic category) {
    if (selectedCategoryId.value != category['id']) {
      selectedCategoryId.value = category['id'];
      workoutController.getWorkoutStyles(category['id']);
    }
  }

  void toggleViewMode() {
    isGridView.value = !isGridView.value;
  }

  void navigateToExercises(String styleId) {
    workoutController.getExercises(styleId);
    Get.toNamed('/exercises-screen', arguments: {'styleId': styleId});
  }

  Future<void> logout() async {
    try {
      isLoading(true);
      await supabaseService.signOut();
      Get.offAllNamed('/auth-screen');
    } catch (e) {
      Get.snackbar('Error', 'Logout failed', animationDuration: Duration(seconds: 3),backgroundColor: Color(0xFF000000), colorText: const Color(0xFFFFFFFF));
    } finally {
      isLoading(false);
    }
  }
}