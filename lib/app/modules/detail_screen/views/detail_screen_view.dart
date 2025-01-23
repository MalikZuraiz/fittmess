import 'package:better_player/better_player.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import '../controllers/detail_screen_controller.dart';

class DetailScreenView extends GetView<DetailScreenController> {
  const DetailScreenView({super.key, required this.exercise});

  final Map<String, dynamic> exercise;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: _buildAppBar(),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 8),
            _buildVideoSection(),
            const SizedBox(height: 16),
            _buildExerciseDetails(),
          ],
        ),
      ),
    );
  }

  AppBar _buildAppBar() {
    return AppBar(
      backgroundColor: Colors.black,
      title: Text(
        exercise['title'],
        style:
            const TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
      ),
      leading: IconButton(
        icon: const Icon(Icons.arrow_back, color: Colors.white),
        onPressed: () => Get.back(),
      ),
    );
  }

  Widget _buildVideoSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "Watch Video",
          style: TextStyle(
              color: Colors.white, fontWeight: FontWeight.bold, fontSize: 18),
        ),
        const SizedBox(height: 8),
        AspectRatio(
          aspectRatio: 9 / 16,
          child: BetterPlayer.network(
            exercise['video_url'],
            betterPlayerConfiguration: BetterPlayerConfiguration(
              aspectRatio: 9 / 16,
              autoPlay: false,
              looping: false,
              controlsConfiguration: BetterPlayerControlsConfiguration(
                enablePlayPause: true,
                enableProgressBar: true,
                enableFullscreen: false,
                enableMute: false,
                controlBarColor: Colors.black.withOpacity(0.7),
              ),
              allowedScreenSleep: false,
              deviceOrientationsOnFullScreen: [DeviceOrientation.portraitUp],
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildExerciseDetails() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            _buildInfoRow('Technique:\n', exercise['technique']),
            _buildInfoRow('Type:\n', exercise['type']),
          ],
        ),
        const SizedBox(height: 16),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            _buildInfoRow('Description:\n', exercise['description']),
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                _buildInfoRow('Sets: ', '${exercise['round']}X'),
                _buildInfoRow('Reps: ', '${exercise['reps']}'),
              ],
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildInfoRow(String label, String value) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          '$label $value',
          style: const TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 14,
          ),
        ),
      ],
    );
  }
}
