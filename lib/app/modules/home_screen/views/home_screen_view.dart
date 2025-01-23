import 'package:fittmess/app/modules/home_screen/controllers/home_screen_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeScreenView extends GetView<HomeScreenController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: Text(
          'Workouts',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        actions: [
          Obx(() {
            return IconButton(
              icon: Icon(controller.isGridView.value ? Icons.grid_view : Icons.list),
              onPressed: controller.toggleViewMode,
            );
          }),
          IconButton(
            icon: Icon(Icons.logout, color: Colors.white),
            onPressed: controller.logout,
          ),
        ],
        backgroundColor: Colors.black,
        centerTitle: true,
      ),
      // Rest of the previous implementation remains the same
      body: Obx(() {
        if (controller.isLoading.value) {
          return Center(child: CircularProgressIndicator());
        }

        return Column(
          children: [
            SizedBox(height: 10),
            _buildCategoryTabs(),
            SizedBox(height: 20),
            Expanded(
              child: controller.isGridView.value 
                  ? _buildGridView() 
                  : _buildListView(),
            ),
          ],
        );
      }),
    );
  }

  Widget _buildCategoryTabs() {
    return SizedBox(
      height: 35,
      child: ListView.builder(
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        itemCount: controller.categories.length,
        itemBuilder: (context, index) {
          final category = controller.categories[index];
          final isSelected = controller.selectedCategoryId.value == category['id'];

          return GestureDetector(
            onTap: () => controller.selectCategory(category),
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              margin: EdgeInsets.symmetric(horizontal: 8),
              decoration: BoxDecoration(
                color: isSelected ? Colors.grey[800] : Colors.grey[300],
                borderRadius: BorderRadius.circular(20),
              ),
              child: Center(
                child: Text(
                  category['name'],
                  style: TextStyle(
                    color: isSelected ? Colors.white : Colors.black,
                    fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
                    fontSize: 13,
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _buildGridView() {
    return GridView.builder(
      padding: EdgeInsets.all(10),
      itemCount: controller.workoutStyles.length,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
        childAspectRatio: 0.8,
      ),
      itemBuilder: (context, index) {
        final style = controller.workoutStyles[index];
        return _buildWorkoutCard(style, index, isGrid: true);
      },
    );
  }

  Widget _buildListView() {
    return ListView.builder(
      padding: EdgeInsets.all(10),
      itemCount: controller.workoutStyles.length,
      itemBuilder: (context, index) {
        final style = controller.workoutStyles[index];
        return _buildWorkoutCard(style, index, isGrid: false);
      },
    );
  }

  Widget _buildWorkoutCard(dynamic style, int index, {bool isGrid = true}) {
    return GestureDetector(
      onTap: () => controller.navigateToExercises(style['id']),
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 6),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: Colors.grey.withOpacity(0.3), width: 1),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.3),
              blurRadius: 3,
              offset: Offset(3, 3),
            ),
          ],
          color: Colors.black,
        ),
        child: isGrid 
            ? _buildGridStyleCard(style, index) 
            : _buildListStyleCard(style, index),
      ),
    );
  }

  Widget _buildGridStyleCard(dynamic style, int index) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        ClipRRect(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(12),
            topRight: Radius.circular(12)
          ),
          child: Image.network(
            style['image_url'],
            width: double.infinity,
            height: 160,
            fit: BoxFit.cover,
          ),
        ),
        SizedBox(height: 8),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              '${index + 1}.',
              style: TextStyle(
                color: Colors.white,
                fontSize: 14,
                fontWeight: FontWeight.bold
              ),
            ),
            SizedBox(width: 10),
            Text(
              style['name'],
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildListStyleCard(dynamic style, int index) {
    return ListTile(
      leading: ClipRRect(
        
        borderRadius: BorderRadius.circular(12),
        child: Image.network(
          style['image_url'],
          width: 80,
          height: 80,
          fit: BoxFit.cover,
        ),
      ),
      title: Text(
        style['name'],
        style: TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.bold,
          fontSize: 15
        ),
      ),
      trailing: Text(
        '#${index + 1}',
        style: TextStyle(
          color: Colors.white,
          fontSize: 14,
          fontWeight: FontWeight.bold
        ),
      ),
    );
  }
}