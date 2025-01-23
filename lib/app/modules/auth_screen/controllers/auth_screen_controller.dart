import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:fittmess/app/services/supabaseService.dart';

class AuthScreenController extends GetxController {
  final SupabaseService supabaseService = Get.find<SupabaseService>();
  
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();

  var isSignUp = true.obs;
  var isLoading = false.obs;

  @override
  void onInit() {
    super.onInit();
    _checkExistingLogin();
  }

  Future<void> _checkExistingLogin() async {
    isLoading.value = true;
    try {
      bool isLoggedIn = await supabaseService.isUserLoggedIn();
      if (isLoggedIn) {
        Get.offAllNamed('/home-screen');
      }
    } catch (e) {
      Get.snackbar('Error', 'Failed to check login status', animationDuration: Duration(seconds: 3),backgroundColor: Color(0xFF000000), colorText: const Color(0xFFFFFFFF));
    } finally {
      isLoading.value = false;
    }
  }

  void toggleAuthMode() {
    isSignUp.value = !isSignUp.value;
    // Reset controllers when switching
    emailController.clear();
    passwordController.clear();
    confirmPasswordController.clear();
  }

  Future<void> authenticate() async {
    if (emailController.text.isEmpty || passwordController.text.isEmpty) {
      Get.snackbar('Error', 'Please fill all fields', animationDuration: Duration(seconds: 3),backgroundColor: Color(0xFF000000), colorText: const Color(0xFFFFFFFF));
      return;
    }

    isLoading.value = true;
    try {
      if (isSignUp.value) {
        await _signUp();
      } else {
        await _signIn();
      }
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> _signUp() async {
    if (passwordController.text != confirmPasswordController.text) {
      Get.snackbar('Error', 'Passwords do not match', animationDuration: Duration(seconds: 3),backgroundColor: Color(0xFF000000), colorText: const Color(0xFFFFFFFF));
      return;
    }

    bool result = await supabaseService.signUp(
      emailController.text, 
      passwordController.text
    );

    if (result) {
      Get.snackbar('Success', 'Account created!', animationDuration: Duration(seconds: 3),backgroundColor: Color(0xFF000000), colorText: const Color(0xFFFFFFFF));
      Get.offAllNamed('/home-screen');
    } else {
      Get.snackbar('Error', 'Sign-up failed', animationDuration: Duration(seconds: 3),backgroundColor: Color(0xFF000000), colorText: const Color(0xFFFFFFFF));
    }
  }

  Future<void> _signIn() async {
    bool result = await supabaseService.signIn(
      emailController.text, 
      passwordController.text
    );

    if (result) {
      Get.snackbar('Success', 'Logged in!', animationDuration: Duration(seconds: 3),backgroundColor: Color(0xFF000000), colorText: const Color(0xFFFFFFFF));
      Get.offAllNamed('/home-screen');
    } else {
      Get.snackbar('Error', 'Sign-in failed', animationDuration: Duration(seconds: 3),backgroundColor: Color(0xFF000000), colorText: const Color(0xFFFFFFFF));
    }
  }

  @override
  void onClose() {
    emailController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
    super.onClose();
  }
}