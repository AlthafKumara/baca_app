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

  Future<void> logout() async {
    try {
      await supabase.auth.signOut();
    } catch (e) {
      throw e;
    }
  }

  Future<void> updateEmailPassword(String? email, String? password) async {
    try {
      if (email!.isEmpty && password!.isNotEmpty) {
        await supabase.auth.updateUser(UserAttributes(password: password));
      } else if (email.isNotEmpty && password!.isEmpty) {
        await supabase.auth.updateUser(UserAttributes(email: email));
      } else {
        await supabase.auth.updateUser(
          UserAttributes(email: email, password: password),
        );
      }
    } catch (e) {
      throw e;
    }
  }
}
