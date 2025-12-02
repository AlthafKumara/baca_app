import 'package:supabase_flutter/supabase_flutter.dart';

class AuthServices {
  final supabase = Supabase.instance.client;

  Future<void> register(String email, String password) async {
    try {
      final response = await supabase.auth.signUp(
        email: email,
        password: password,
        data: {'role': "user"},
      );

      final user = response.user;

      if (user != null) {
        print('User registered: ${user.email}');
      }
    } catch (e) {
      throw e;
    }
  }

  Future<void> login(String email, String password) async {
    try {
      final response = await supabase.auth.signInWithPassword(
        email: email,
        password: password,
      );

      final user = response.user;

      if (user == null) throw "Login failed, check your email and password";
    } on AuthException catch (_) {
      throw "Login failed, check your email and password";
    } catch (e) {
      throw "Unexpected error: $e";
    }
  }
}
