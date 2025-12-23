import 'package:supabase_flutter/supabase_flutter.dart';

class LoginRepository {
  final supabase = Supabase.instance.client;

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
