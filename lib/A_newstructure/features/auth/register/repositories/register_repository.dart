import 'package:supabase_flutter/supabase_flutter.dart';

class RegisterRepository {
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
}
