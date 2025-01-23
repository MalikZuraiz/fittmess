import 'package:get/get.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class SupabaseService extends GetxService {
  final _supabase = Supabase.instance.client;

  // Sign Up
  Future<bool> signUp(String email, String password) async {
    try {
      final response = await _supabase.auth.signUp(email: email, password: password);
      return response.user != null; // Returns true if signup is successful
    } catch (e) {
      print('SignUp Error: $e');
      return false;
    }
  }
Future<bool> isUserLoggedIn() async {
  try {
    final user =  _supabase.auth.currentUser;
    return user != null;
  } catch (e) {
    return false;
  }
}
Future<void> signOut() async {
  try {
    await _supabase.auth.signOut();
  } catch (e) {
    throw Exception('Logout failed');
  }
}
  // Sign In
  Future<bool> signIn(String email, String password) async {
    try {
      final response = await _supabase.auth.signInWithPassword(email: email, password: password);
      return response.user != null; // Returns true if signin is successful
    } catch (e) {
      print('SignIn Error: $e');
      return false;
    }
  }

 // Fetch all categories
  Future<List<Map<String, dynamic>>> fetchCategories() async {
    try {
      final response = await _supabase.from('categories').select('*');
      return response;
    } catch (e) {
      print('Fetch Categories Error: $e');
      return [];
    }
  }

  // Fetch workout styles by level
  Future<List<Map<String, dynamic>>> fetchWorkoutStylesByLevel(String levelId) async {
    try {
      final response = await _supabase
          .from('workout_styles')
          .select('*')
          .eq('category_id', levelId);
      return response;
    } catch (e) {
      print('Fetch Styles Error: $e');
      return [];
    }
  }

 // Fetch exercises by style
  Future<List<Map<String, dynamic>>> fetchExercisesByStyle(String styleId) async {
    try {
      final response = await _supabase
          .from('exercises')
          .select('*')
          .eq('style_id', styleId)
          .order('round', ascending: true);
      return response;
    } catch (e) {
      print('Fetch Exercises Error: $e');
      return [];
    }
  }
}
