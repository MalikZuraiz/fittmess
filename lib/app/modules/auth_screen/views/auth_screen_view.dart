import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/auth_screen_controller.dart';

class AuthScreenView extends GetView<AuthScreenController> {
  const AuthScreenView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: SingleChildScrollView(
          child: Container(
            width: 300,
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: Colors.black,
              borderRadius: BorderRadius.circular(20),
              border: Border.all(color: Colors.grey.withOpacity(0.3), width: 2),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.3),
                  blurRadius: 5,
                  offset: Offset(5, 5),
                ),
              ],
            ),
            child: Obx(() => 
              controller.isLoading.value 
                ? _buildLoadingIndicator() 
                : _buildAuthContent()
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildLoadingIndicator() {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          CircularProgressIndicator(color: Colors.white),
          SizedBox(height: 20),
          Text(
            'Processing...',
            style: TextStyle(color: Colors.white),
          ),
        ],
      ),
    );
  }

  Widget _buildAuthContent() {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text('Authenticate',
            style: TextStyle(
                color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.bold)),
        SizedBox(height: 20),
        _buildTabBar(),
        SizedBox(height: 20),
        Obx(() => controller.isSignUp.value
            ? _buildSignUpForm()
            : _buildSignInForm()),
      ],
    );
  }

  Widget _buildTabBar() {
    return Obx(() => Row(
          children: [
            Expanded(
              child: GestureDetector(
                onTap: () => controller.isSignUp.value = true,
                child: Container(
                  padding: EdgeInsets.symmetric(vertical: 5),
                  decoration: BoxDecoration(
                    color:
                        controller.isSignUp.value ? Colors.white : Colors.black,
                    borderRadius: BorderRadius.circular(16),
                    border: Border.all(
                        color: Colors.grey.withOpacity(0.3), width: 1),
                  ),
                  child: Center(
                    child: Text(
                      'Sign Up',
                      style: TextStyle(
                        color: controller.isSignUp.value
                            ? Colors.black
                            : Colors.white,
                        fontSize: 13,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(width: 10),
            Expanded(
              child: GestureDetector(
                onTap: () => controller.isSignUp.value = false,
                child: Container(
                  padding: EdgeInsets.symmetric(vertical: 5),
                  decoration: BoxDecoration(
                    color: !controller.isSignUp.value
                        ? Colors.white
                        : Colors.black,
                    borderRadius: BorderRadius.circular(16),
                    border: Border.all(
                        color: Colors.grey.withOpacity(0.3), width: 1),
                  ),
                  child: Center(
                    child: Text(
                      'Sign In',
                      style: TextStyle(
                        color: !controller.isSignUp.value
                            ? Colors.black
                            : Colors.white,
                        fontSize: 13,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ));
  }

  Widget _buildSignUpForm() {
    return Column(
      children: [
        _buildTextField(
          controller: controller.emailController,
          hintText: 'Email',
          prefixIcon: Icons.email_outlined,
        ),
        SizedBox(height: 15),
        _buildTextField(
          controller: controller.passwordController,
          hintText: 'Password',
          prefixIcon: Icons.lock_outline,
          obscureText: true,
        ),
        SizedBox(height: 15),
        _buildTextField(
          controller: controller.confirmPasswordController,
          hintText: 'Confirm Password',
          prefixIcon: Icons.lock_outline,
          obscureText: true,
        ),
        SizedBox(height: 25),
        _buildAuthButton('Sign Up'),
      ],
    );
  }

  Widget _buildSignInForm() {
    return Column(
      children: [
        _buildTextField(
          controller: controller.emailController,
          hintText: 'Email',
          prefixIcon: Icons.email_outlined,
        ),
        SizedBox(height: 15),
        _buildTextField(
          controller: controller.passwordController,
          hintText: 'Password',
          prefixIcon: Icons.lock_outline,
          obscureText: true,
        ),
        SizedBox(height: 25),
        _buildAuthButton('Sign In'),
      ],
    );
  }

  Widget _buildTextField({
    required TextEditingController controller,
    required String hintText,
    required IconData prefixIcon,
    bool obscureText = false,
  }) {
    return Container(
      
      height: 40,
      decoration: BoxDecoration(
        color: Colors.black,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Colors.grey.withOpacity(0.3), width: 1),
      ),
      child: TextField(
        controller: controller,
        obscureText: obscureText,
        style: TextStyle(color: Colors.white, fontSize: 14),
        decoration: InputDecoration(
          hintText: hintText,
          hintStyle: TextStyle(color: Colors.grey),
          prefixIcon: Icon(prefixIcon, color: Colors.grey, size: 20),
          border: InputBorder.none,
          contentPadding: EdgeInsets.symmetric(vertical:12,horizontal: 15),
        ),
      ),
    );
  }

  Widget _buildAuthButton(String text) {
    return ElevatedButton(
      onPressed: controller.authenticate,
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.white,
        minimumSize: Size(double.infinity, 40),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
      ),
      child: Text(
        text,
        style: TextStyle(
          color: Colors.black,
          fontSize: 14,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
