import 'package:fittmess/app/services/workoutController.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/exercises_screen_controller.dart';

class ExercisesScreenView extends GetView<ExercisesScreenController> {
  final String styleId;

  ExercisesScreenView({super.key, required this.styleId});

  final WorkoutController workoutController = Get.find<WorkoutController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: 
        Column(
          children: [
            _buildHeader(),
            _buildStyleTitle(),
            Obx(() {
              if (controller.isLoading) {
                return _buildLoading();
                }
                else if (controller.exercises.isEmpty) {
                  return _buildNoExercisesFound();
                }
              else {
                return _buildExerciseList();
              }
            }),
          ],
        ),
    );
  }

  // Loading widget
  Widget _buildLoading() {
    return Center(child: CircularProgressIndicator());
  }

  // No exercises found widget
  Widget _buildNoExercisesFound() {
    return Center(
        child:
            Text('No exercises found.', style: TextStyle(color: Colors.white)));
  }

  // Header with background image and back button
  Widget _buildHeader() {
    return Stack(
      children: [
        // Background Image
        Container(
          width: double.infinity,
          height: 250,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: NetworkImage(controller.workoutStyleImageUrl),
              fit: BoxFit.cover,
            ),
          ),
        ),
        Positioned(
          top: 40,
          left: 10,
          child: IconButton(
            icon: Icon(Icons.arrow_back, color: Colors.white),
            onPressed: () => Get.back(),
          ),
        ),
      ],
    );
  }

  // Style name title
  Widget _buildStyleTitle() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Text(
        controller.workoutStyleName,
        style: TextStyle(
            fontSize: 24, fontWeight: FontWeight.bold, color: Colors.white),
      ),
    );
  }

  // List of exercises in ListView
  Widget _buildExerciseList() {
    return Expanded(
      child: ListView.builder(
        padding: EdgeInsets.all(10),
        itemCount: controller.exercises.length,
        itemBuilder: (context, index) {
          final exercise = controller.exercises[index];
          return _buildExerciseListTile(exercise, index);
        },
      ),
    );
  }

  // Exercise ListTile widget
  Widget _buildExerciseListTile(Map<String, dynamic> exercise, int index) {
    return GestureDetector(
      onTap: () {
        Get.toNamed(
          '/detail-screen',
          arguments: {'exercise': exercise},
        );
      },
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 6),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: Colors.grey.withOpacity(0.3), width: 1),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.3),
              blurRadius: 2,
              offset: Offset(2, 2),
            ),
          ],
          color: Colors.black,
        ),
        child: ListTile(
          leading: Text(
            '${index + 1}.',
            style: TextStyle(
              color: Colors.white,
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
          title: Text(
            exercise['title'],
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
          ),
          subtitle: Text(
            exercise['description'],
            style: TextStyle(
              color: Colors.grey,
              fontSize: 14,
            ),
          ),
          trailing: Text(
            '${exercise['round']} X Set',
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 12,
            ),
          ),
          contentPadding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
        ),
      ),
    );
  }
}
